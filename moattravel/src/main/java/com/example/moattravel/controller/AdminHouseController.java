package com.example.moattravel.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.moattravel.entity.House;
import com.example.moattravel.repository.HouseRepository;

@Controller
@RequestMapping("/admin/houses") //先にこれを書いておくことで、"/admin/houses"を繰り返し書かなくて済む
public class AdminHouseController {

	//HouseRepositoryに依存している(DI)
	//一度初期化されたら変更されない
	private final HouseRepository houseRepository;

	//HouseRepositoryをつかうためにコンストラクタで受け取っている
	public AdminHouseController(HouseRepository houseRepository) {
		this.houseRepository = houseRepository;
	}

	//@RequestMapping("/admin/houses")を書いているからもう一度書かなくてOK
	@GetMapping
	//Model=データをhtmlに渡す
	//public String index(Model model, Pageable pageable) {←これは表示数を減らしただけ
	//@PageableDefault←ページをめくれるようにする役割
	//public String index(Model model, @PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable) {←いらない
	public String index(Model model,
			@PageableDefault(page = 0, size = 10, sort = "id", direction = Direction.ASC) Pageable pageable,
			//required-検索を必須にするか否か。false→nullの場合もエラーにならずに続行
			@RequestParam(name = "keyword", required = false) String keyword) {

		//HouseRepository を使って 全ての House データを取得
		//8章でページネーションを追加
		//List<House> houses = houseRepository.findAll();←いらなくなった。ただリストとして出すやつ
		//Page<House> housePage = houseRepository.findAll(pageable);←検索しない場合のページネーション
		Page<House> housePage;
		if (keyword != null && !keyword.isEmpty()) {
			housePage = houseRepository.findByNameLike("%" + keyword + "%", pageable);
		} else {
			housePage = houseRepository.findAll(pageable);
		}

		//Viewで使えるようにデータを渡す。htmlで${houses]と書ける
		//model.addAttribute("houses", houses);←いらなくなった
		model.addAttribute("housePage", housePage);
		model.addAttribute("keyword", keyword);
		//src/main/resources/templates/admin/houses/index.htmlを表示
		return "admin/houses/index";
	}
}

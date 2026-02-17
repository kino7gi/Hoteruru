package com.example.moattravel.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.moattravel.entity.House;
import com.example.moattravel.repository.HouseRepository;

@Controller
@RequestMapping("/houses")
public class HouseController {
	private final HouseRepository houseRepository;

	public HouseController(HouseRepository houseRepository) {
		this.houseRepository = houseRepository;
	}

	@GetMapping
	public String listHouses(
			Model model,//コントローラからテンプレートにあたいを渡すためのオブジェクト
			Pageable pageable,//ページ番号、ページサイズ、ソート順
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String area,
			@RequestParam(required = false) Integer price) {
		// Page<House> を取得（検索条件なしの簡易例）
		Page<House> housePage = houseRepository.findAll(pageable);

		model.addAttribute("housePage", housePage); // テンプレートの変数名と一致させる
		model.addAttribute("keyword", keyword);
		model.addAttribute("area", area);
		model.addAttribute("price", price);

		return "houses/index"; // templates/houses/index.html
	}
}

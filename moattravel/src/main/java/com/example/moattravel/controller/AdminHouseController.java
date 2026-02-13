package com.example.moattravel.controller;

//管理者画面のコントローラー
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.moattravel.entity.House;
import com.example.moattravel.form.HouseEditForm;
import com.example.moattravel.form.HouseRegisterForm;
import com.example.moattravel.repository.HouseRepository;
import com.example.moattravel.service.HouseService;

@Controller
@RequestMapping("/admin/houses") //先にこれを書いておくことで、"/admin/houses"を繰り返し書かなくて済む
public class AdminHouseController {

	//HouseRepositoryに依存している(DI)
	//一度初期化されたら変更されない
	private final HouseRepository houseRepository;
	private final HouseService houseService;

	//HouseRepositoryをつかうためにコンストラクタで受け取っている
	public AdminHouseController(HouseRepository houseRepository, HouseService houseService) {
		this.houseRepository = houseRepository;
		this.houseService = houseService;
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
		//keywordが存在する場合は検索し、そうでない場合はいつもどおり
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

	@GetMapping("/{id}")
	//@PathVariableでidの値をURLに入れることができる
	public String show(@PathVariable(name = "id") Integer id, Model model) {
		House house = houseRepository.getReferenceById(id);

		model.addAttribute("house", house);

		return "admin/houses/show";
	}

	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("houseRegisterForm", new HouseRegisterForm());
		return "admin/houses/register";
	}

	//リクエストを送信する為のメソッド
	@PostMapping("/create")
	public String create(@ModelAttribute @Validated HouseRegisterForm houseRegisterForm,
			//バリデーション結果を入れる箱
			//@Validatedの直後に書かないとエラーになる
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors()) {
			return "admin/houses/register";
		}

		houseService.create(houseRegisterForm);
		//redirectAttributes→リダイレクト先にデータを渡すことができるようにする仕組み
		//addFlashAttributeがあることで、一回値を渡したら、自動的にデータを削除してくれる
		redirectAttributes.addFlashAttribute("successMessage", "民宿を登録しました。");

		return "redirect:/admin/houses";
	}

	//民宿詳細を編集するためのコンストラクタ
	@GetMapping("/{id}/edit")
	//変更したいページのIDを取得
	public String edit(@PathVariable(name = "id") Integer id, Model model) {

		House house = houseRepository.getReferenceById(id);
		//民宿画像のファイル名を取得する
		String imageName = house.getImageName();

		//ホームをインスタンス化
		HouseEditForm houseEditForm = new HouseEditForm(
				house.getId(),
				house.getName(),
				null,
				house.getDescription(),
				house.getPrice(),
				house.getCapacity(),
				house.getPostalCode(),
				house.getAddress(),
				house.getPhoneNumber());

		//民宿画像のファイル名をビューに渡す
		model.addAttribute("imageName", imageName);
		//生成したインスタンスをビューに渡す
		model.addAttribute("houseEditForm", houseEditForm);

		return "admin/houses/edit";
	}

	@PostMapping("/{id}/update")
	public String update(@ModelAttribute @Validated HouseEditForm houseEditForm,
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		if (bindingResult.hasErrors()) {
			return "admin/houses/edit";
		}

		houseService.update(houseEditForm);
		redirectAttributes.addFlashAttribute("successMessage", "民宿情報を編集しました。");

		return "redirect:/admin/houses";
	}
	
	//削除画面
	@PostMapping("/{id}/delete")
	public String delete(@PathVariable(name = "id") Integer id, RedirectAttributes redirectAttributes) {
		houseRepository.deleteById(id);

		redirectAttributes.addFlashAttribute("successMessage", "民宿を削除しました。");

		return "redirect:/admin/houses";
	}

}

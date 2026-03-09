package com.example.perfume.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.perfume.entity.Bottle;
import com.example.perfume.entity.Scent;
import com.example.perfume.repository.AdminRepository;
import com.example.perfume.repository.BottleRepository;
import com.example.perfume.repository.ScentRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminRepository adminRepository;

	// ログイン画面を表示
	@GetMapping("/login")
	public String loginPage() {
		return "admin/login";
	}

	// ログイン処理
	@PostMapping("/login")
	public String login(@RequestParam String userId,
			@RequestParam String password,
			HttpSession session,
			Model model) {

		return adminRepository.findByUserId(userId)
				.filter(admin -> admin.getPassword().equals(password)) // パスワード一致チェック
				.map(admin -> {
					session.setAttribute("isLoggedIn", true);
					return "redirect:/admin/dashboard";
				})
				.orElseGet(() -> {
					model.addAttribute("error", "IDまたはパスワードが違います");
					return "admin/login";
				});
	}

	// ログアウト処理
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // セッションを破棄
		return "redirect:/admin/login";
	}

	@Autowired
	private ScentRepository scentRepository;

	@Autowired
	private BottleRepository bottleRepository;

	// ダッシュボードに一覧を表示
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("isLoggedIn") == null)
			return "redirect:/admin/login";

		model.addAttribute("scents", scentRepository.findAll()); // DBから全取得
		model.addAttribute("bottles", bottleRepository.findAll());
		return "admin/dashboard";
	}

	// @PostMapping("/update-stock") を以下に変更
	@PostMapping("/update-scent-stock")
	@ResponseBody
	public String updateScentStock(@RequestParam Long id, @RequestParam Integer stock, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		Scent scent = scentRepository.findById(id).orElseThrow();
		scent.setStock(stock);
		scentRepository.save(scent);
		return "success";
	}

	// ボトルの在庫を更新
	@PostMapping("/update-bottle-stock")
	@ResponseBody
	public String updateBottleStock(@RequestParam Long id, @RequestParam Integer stock, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		Bottle bottle = bottleRepository.findById(id).orElseThrow();
		bottle.setStock(stock);
		bottleRepository.save(bottle);
		return "success";
	}

	@PostMapping("/add-scent")
	@ResponseBody
	public String addScent(
			@RequestParam String name,
			@RequestParam String description, // ★追加
			@RequestParam Integer stock,
			@RequestParam(value = "image", required = false) MultipartFile image, // ★名前を 'image' に変更
			HttpSession session) throws IOException {

		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		Scent newScent = new Scent();
		newScent.setName(name);
		newScent.setDescription(description); // ★セットする
		newScent.setStock(stock);

		if (image != null && !image.isEmpty()) {
			String fileName = image.getOriginalFilename();
			// 静的リソースフォルダへ保存
			Path uploadPath = Paths.get("src/main/resources/static/images/" + fileName);
			Files.copy(image.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
			newScent.setImageUrl(fileName);
		}

		scentRepository.save(newScent);
		return "success";
	}

	// 新しいボトルを追加
	@PostMapping("/add-bottle")
	@ResponseBody
	public String addBottle(
			@RequestParam String name,
			@RequestParam String capacity,
			@RequestParam Integer stock,
			@RequestParam(value = "imageFile", required = false) MultipartFile imageFile, // 追加
			HttpSession session) throws IOException { // throws IOException を追加

		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		Bottle newBottle = new Bottle();
		newBottle.setName(name);
		newBottle.setCapacity(capacity);
		newBottle.setStock(stock);

		// 画像保存処理
		if (imageFile != null && !imageFile.isEmpty()) {
			String fileName = imageFile.getOriginalFilename();
			Path uploadPath = Paths.get("src/main/resources/static/images/" + fileName);
			Files.copy(imageFile.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
			newBottle.setImageUrl(fileName); // Entityにファイル名をセット
		}

		bottleRepository.save(newBottle);
		return "success";
	}

	// 香りの削除
	@PostMapping("/delete-scent")
	@ResponseBody
	public String deleteScent(@RequestParam Long id, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		scentRepository.deleteById(id);
		return "success";
	}

	// ボトルの削除
	@PostMapping("/delete-bottle")
	@ResponseBody
	public String deleteBottle(@RequestParam Long id, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		bottleRepository.deleteById(id);
		return "success";
	}
}
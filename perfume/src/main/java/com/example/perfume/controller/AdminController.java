package com.example.perfume.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.perfume.entity.Bottle;
import com.example.perfume.entity.Order;
import com.example.perfume.entity.Scent;
import com.example.perfume.repository.AdminRepository;
import com.example.perfume.repository.BottleRepository;
import com.example.perfume.repository.OrderRepository;
import com.example.perfume.repository.ScentRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminRepository adminRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private ScentRepository scentRepository;

	@Autowired
	private BottleRepository bottleRepository;

	// ログイン画面を表示
	@GetMapping("/login")
	public String loginPage() {
		return "admin/login";
	}

	// 注文一覧を表示
	// クラスに /admin がついているので、ここは "/orders" だけでOK
	@GetMapping("/orders")
	public String listOrders(HttpSession session, Model model) {
		// セッションチェック（ログインしていない場合はログイン画面へ）
		if (session.getAttribute("isLoggedIn") == null) {
			return "redirect:/admin/login";
		}

		// DBからすべての注文を「IDの降順（新しい順）」で取得
		// Repositoryに findAllByOrderByIdDesc() を作成しておく必要があります
		List<Order> orders = orderRepository.findAllByOrderByIdDesc();

		model.addAttribute("orders", orders);
		return "admin/order_list";
	}

	// ログイン処理
	@PostMapping("/login")
	public String login(@RequestParam String userId,
			@RequestParam String password,
			HttpSession session,
			Model model) {

		return adminRepository.findByUserId(userId)
				.filter(admin -> admin.getPassword().equals(password))
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
		session.invalidate();
		return "redirect:/admin/login";
	}

	// ダッシュボードに一覧を表示
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("isLoggedIn") == null)
			return "redirect:/admin/login";

		model.addAttribute("scents", scentRepository.findAll());
		model.addAttribute("bottles", bottleRepository.findAll());
		return "admin/dashboard";
	}

	@GetMapping("/orders")
	public String listOrders(HttpSession session, Model model) {
		if (session.getAttribute("isLoggedIn") == null) {
			return "redirect:/admin/login";
		}

		// Repositoryのメソッド名に合わせて修正
		// OrderRepositoryに findAllByOrderByIdDesc() があるか確認してください
		List<Order> orders = orderRepository.findAllByOrderByIdDesc();

		model.addAttribute("orders", orders);
		return "admin/order_list";
	}

	/**
	 * 注文削除処理
	 * HTML側のフォームから送られる ID を受け取って削除します
	 */
	@PostMapping("/orders/delete/{id}")
	public String deleteOrder(@PathVariable("id") Long id, HttpSession session) {
		// セッションチェック
		if (session.getAttribute("isLoggedIn") == null) {
			return "redirect:/admin/login";
		}

		// IDを指定して削除
		orderRepository.deleteById(id);

		// 削除後は一覧画面にリダイレクト
		return "redirect:/admin/orders";
	}

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
			@RequestParam String description,
			@RequestParam Integer stock,
			@RequestParam(value = "image", required = false) MultipartFile image,
			HttpSession session) throws IOException {

		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		Scent newScent = new Scent();
		newScent.setName(name);
		newScent.setDescription(description);
		newScent.setStock(stock);

		if (image != null && !image.isEmpty()) {
			String fileName = image.getOriginalFilename();
			Path uploadPath = Paths.get("src/main/resources/static/images/" + fileName);
			Files.copy(image.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
			newScent.setImageUrl(fileName);
		}

		scentRepository.save(newScent);
		return "success";
	}

	@PostMapping("/add-bottle")
	@ResponseBody
	public String addBottle(
			@RequestParam String name,
			@RequestParam String capacity,
			@RequestParam Integer stock,
			@RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
			HttpSession session) throws IOException {

		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";

		Bottle newBottle = new Bottle();
		newBottle.setName(name);
		newBottle.setCapacity(capacity);
		newBottle.setStock(stock);

		if (imageFile != null && !imageFile.isEmpty()) {
			String fileName = imageFile.getOriginalFilename();
			Path uploadPath = Paths.get("src/main/resources/static/images/" + fileName);
			Files.copy(imageFile.getInputStream(), uploadPath, StandardCopyOption.REPLACE_EXISTING);
			newBottle.setImageUrl(fileName);
		}

		bottleRepository.save(newBottle);
		return "success";
	}

	@PostMapping("/delete-scent")
	@ResponseBody
	public String deleteScent(@RequestParam Long id, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";
		scentRepository.deleteById(id);
		return "success";
	}

	@PostMapping("/delete-bottle")
	@ResponseBody
	public String deleteBottle(@RequestParam Long id, HttpSession session) {
		if (session.getAttribute("isLoggedIn") == null)
			return "Unauthorized";
		bottleRepository.deleteById(id);
		return "success";
	}
}
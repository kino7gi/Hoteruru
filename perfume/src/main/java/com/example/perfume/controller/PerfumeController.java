package com.example.perfume.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.perfume.dto.OrderForm;
import com.example.perfume.dto.UserForm;
import com.example.perfume.entity.Order;
import com.example.perfume.repository.OrderRepository;
import com.example.perfume.service.PerfumeService;

import jakarta.validation.Valid;

@Controller
public class PerfumeController {

	@Autowired
	private PerfumeService perfumeService;

	@Autowired
	private OrderRepository orderRepository;

	@GetMapping("/")
	public String index(Model model) {
		// Thymeleafのフォームと連携させるために空のオブジェクトを渡す
		model.addAttribute("orderForm", new OrderForm());
		model.addAttribute("userForm", new UserForm());
		return "index";
	}

	@PostMapping("/order")
	public String placeOrder(
			@Valid @ModelAttribute("orderForm") OrderForm orderForm, // バリデーションを実行
			BindingResult result, // チェック結果を格納
			Model model) {

		// --- 1. Java側でのバリデーション（誤字・未入力チェック） ---
		if (result.hasErrors()) {
			// エラーがある場合は index.html に戻る
			// JS側で「エラーがある場合は住所入力から表示」する制御が必要
			model.addAttribute("hasErrors", true);
			return "index";
		}

		// --- 2. Serviceで注文エンティティの生成（計算・判定ロジック） ---
		// 前回のService修正で引数を OrderForm に変更している前提です
		Order order = perfumeService.createOrder(orderForm);

		// --- 3. Repositoryで保存 ---
		orderRepository.save(order);

		// --- 4. 結果画面（result.html）へデータを渡す ---
		model.addAttribute("order", order);
		// まとめて order を渡すことで result.html 側で [[${order.title}]] などと書けます

		return "result";
	}
}
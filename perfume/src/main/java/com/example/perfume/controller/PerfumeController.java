package com.example.perfume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.perfume.model.dto.OrderForm;

@Controller
@SessionAttributes("orderForm") // セッションで注文情報を保持
public class PerfumeController {

	// 最初に注文フォームを初期化
	@ModelAttribute("orderForm")
	public OrderForm setUpForm() {
		return new OrderForm();
	}

	@GetMapping("/")
	public String top() {
		return "top";
	}

	@GetMapping("/intro")
	public String intro() {
		return "intro";
	}

	@GetMapping("/mix")
	public String mix() {
		return "mix";
	}

	// 4. お届け先入力へ（調合結果を保存）
	@PostMapping("/order")
	public String toOrder(@ModelAttribute("orderForm") OrderForm form) {
		return "order";
	}

	// 5. 完了画面へ
	@PostMapping("/complete")
	public String complete(@ModelAttribute("orderForm") OrderForm form, SessionStatus status) {
		// ここでDB保存処理などを入れる
		// status.setComplete(); // 完了後にセッションをクリアする場合
		return "complete";
	}
}
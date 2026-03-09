package com.example.perfume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.perfume.entity.Scent;
import com.example.perfume.model.dto.OrderForm;
import com.example.perfume.repository.BottleRepository;
import com.example.perfume.repository.ScentRepository;
import com.example.perfume.service.ScentService;

@Controller
@SessionAttributes("orderForm") // セッションで注文情報を保持
public class PerfumeController {

	@Autowired
	private ScentService scentService;

	@Autowired
	private ScentRepository scentRepository;

	@Autowired
	private BottleRepository bottleRepository;

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
	public String showIntro(Model model) {
		List<Scent> scents = scentService.findAll(); // DBから全件取得
		model.addAttribute("scents", scents);
		return "intro";
	}

	@GetMapping("/mix")
	public String showMixPage(Model model) {
		// DBから最新のリストを取得
		model.addAttribute("scents", scentRepository.findAll());
		model.addAttribute("bottles", bottleRepository.findAll());

		// 既存のOrderForm初期化（もし @ModelAttribute でやっていなければ）
		if (!model.containsAttribute("orderForm")) {
			model.addAttribute("orderForm", new OrderForm());
		}

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
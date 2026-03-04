package com.example.perfume.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PerfumeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@PostMapping("/order")
	public String placeOrder(
			@RequestParam(value = "scents", required = false) List<String> scents,
			@RequestParam("bottleType") String bottleType,
			Model model) {

		String message = "あなたのために、特別な香りを調合いたします。";
		String title = "Custom Blend";

		// --- 1. 組み合わせ判定ロジック ---
		if (scents != null && scents.size() >= 2) {
			if (scents.contains("Rose") && scents.contains("Citrus")) {
				title = "朝露の庭園";
				message = "華やかなローズに爽やかなシトラスが重なる、目覚めの香りです。";
			} else if (scents.contains("Rose") && scents.contains("Lavender")) {
				title = "優雅な休息";
				message = "高貴なローズと安らぎのラベンダーが包み込む、贅沢なひととき。";
			} else if (scents.contains("Citrus") && scents.contains("Woody")) {
				title = "深呼吸の森";
				message = "清涼感のあるシトラスと、落ち着いたウッディが調和する知的な香り。";
			} else if (scents.contains("Lavender") && scents.contains("Woody")) {
				title = "月夜の瞑想";
				message = "静かな森に漂うラベンダーのような、深く穏やかな香りです。";
			}
		} else if (scents != null && scents.size() == 1) {
			message = scents.get(0) + "の個性を活かした、シンプルな調合でお届けします。";
		}

		// --- 【新設】金額計算ロジック ---
		int totalPrice = 0;
		int scentCount = (scents != null) ? scents.size() : 0;

		if (scentCount == 1) {
			totalPrice = 8000;
		} else if (scentCount == 2) {
			totalPrice = 12000;
		}

		// --- 2. ui.Model を使ってView（HTML）にデータを渡す ---
		model.addAttribute("title", title);
		model.addAttribute("message", message);
		model.addAttribute("selectedScents", scents);
		model.addAttribute("selectedBottle", bottleType);
		model.addAttribute("totalPrice", totalPrice); // ここで金額を渡す！

		return "order-result";
	}
}
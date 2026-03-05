// src/main/java/com/example/perfume/controller/PerfumeController.java
package com.example.perfume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.perfume.entity.Order;
import com.example.perfume.repository.OrderRepository;
import com.example.perfume.service.PerfumeService;

@Controller
public class PerfumeController {

	@Autowired
	private PerfumeService perfumeService;

	@Autowired
	private OrderRepository orderRepository;

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@PostMapping("/order")
	public String placeOrder(
			@RequestParam(value = "scents", required = false) List<String> scents,
			@RequestParam(value = "bottleType", defaultValue = "Clear") String bottleType,
			Model model) {

		// Serviceでロジック実行
		Order order = perfumeService.createOrder(scents, bottleType);

		// Repositoryで保存（形だけ）
		orderRepository.save(order);

		// Modelに詰め直し
		model.addAttribute("title", order.getTitle());
		model.addAttribute("message", order.getMessage());
		model.addAttribute("selectedScents", order.getScents());
		model.addAttribute("selectedBottle", order.getBottleType());
		model.addAttribute("totalPrice", order.getTotalPrice());

		return "result";
	}
}
package com.example.perfume.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.perfume.entity.Order;
import com.example.perfume.entity.Scent;
import com.example.perfume.model.dto.OrderForm;
import com.example.perfume.repository.BottleRepository;
import com.example.perfume.repository.OrderRepository;
import com.example.perfume.repository.ScentRepository;
import com.example.perfume.service.ScentService;
import com.stripe.Stripe;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("orderForm")
public class PerfumeController {

	private String stripeApiKey = "sk_test_51SyiNdAKF64NSnzIzrjQQaiTGtfKIIbcCjqibz7A7TaKiKtSO3awXfJDD3q8mDHyaLW8z3FAc8aMH1aS8fGUD7AQ00moNaLO5s";

	@Autowired
	private ScentService scentService;

	@Autowired
	private ScentRepository scentRepository;

	@Autowired
	private BottleRepository bottleRepository;

	@Autowired
	private OrderRepository orderRepository;

	@PostConstruct
	public void init() {
		Stripe.apiKey = stripeApiKey;
	}

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
		List<Scent> scents = scentService.findAll();
		model.addAttribute("scents", scents);
		return "intro";
	}

	@GetMapping("/mix")
	public String showMixPage(Model model) {
		model.addAttribute("scents", scentRepository.findAll());
		model.addAttribute("bottles", bottleRepository.findAll());
		if (!model.containsAttribute("orderForm")) {
			model.addAttribute("orderForm", new OrderForm());
		}
		return "mix";
	}

	@PostMapping("/order")
	public String confirmOrder(@ModelAttribute OrderForm orderForm, Model model) {
		// --- 修正箇所：香りの複数IDから名前のリストを取得 ---
		if (orderForm.getScentIds() != null && !orderForm.getScentIds().isEmpty()) {
			List<String> names = new ArrayList<>();
			for (Long id : orderForm.getScentIds()) {
				scentRepository.findById(id).ifPresent(scent -> names.add(scent.getName()));
			}
			orderForm.setScentNames(names);
		}

		// ボトルの処理は単体なのでそのまま
		if (orderForm.getBottleId() != null) {
			bottleRepository.findById(orderForm.getBottleId())
					.ifPresent(bottle -> orderForm.setBottleName(bottle.getName()));
		}
		model.addAttribute("orderForm", orderForm);
		return "order";
	}

	@PostMapping("/complete")
	public String redirectToStripe(@ModelAttribute("orderForm") OrderForm orderForm) {
		// --- 修正箇所：Stripe表示用にリストを文字列に結合 ---
		String joinedNames = (orderForm.getScentNames() != null)
				? String.join(" / ", orderForm.getScentNames())
				: "Custom Blend";

		SessionCreateParams params = SessionCreateParams.builder()
				.addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
				.setMode(SessionCreateParams.Mode.PAYMENT)
				.setSuccessUrl("http://localhost:9000/complete")
				.setCancelUrl("http://localhost:9000/mix")
				.addLineItem(SessionCreateParams.LineItem.builder()
						.setQuantity(1L)
						.setPriceData(SessionCreateParams.LineItem.PriceData.builder()
								.setCurrency("jpy")
								.setUnitAmount(3000L)
								.setProductData(SessionCreateParams.LineItem.PriceData.ProductData.builder()
										.setName("Original Perfume: " + joinedNames)
										.build())
								.build())
						.build())
				.build();

		try {
			Session session = Session.create(params);
			return "redirect:" + session.getUrl();
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/mix";
		}
	}

	@GetMapping("/complete")
	public String completeOrder(@ModelAttribute("orderForm") OrderForm orderForm, HttpSession session, Model model) {
		// --- 修正箇所：ガード条件を複数形に変更 ---
		if (orderForm == null || orderForm.getScentNames() == null) {
			return "redirect:/";
		}

		Order order = new Order();
		order.setUserName(orderForm.getUserName());
		order.setPostCode(orderForm.getPostCode());
		order.setAddress(orderForm.getAddress());
		order.setPhoneNumber(orderForm.getPhoneNumber());

		// --- 修正箇所：DB保存用に名前を結合 ---
		String joinedNames = String.join(" / ", orderForm.getScentNames());
		order.setScentName(joinedNames);

		order.setBottleName(orderForm.getBottleName());

		orderRepository.save(order);

		// 完了画面表示用にデータをセット
		model.addAttribute("orderData", orderForm);

		session.removeAttribute("orderForm");
		return "complete";
	}
}
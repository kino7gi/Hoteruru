package com.example.perfume.controller;

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

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("orderForm") // セッションで注文情報を保持
public class PerfumeController {

	@Autowired
	private ScentService scentService;

	@Autowired
	private ScentRepository scentRepository;

	@Autowired
	private BottleRepository bottleRepository;

	@Autowired
	private OrderRepository orderRepository;

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

	@PostMapping("/order")
	public String confirmOrder(@ModelAttribute OrderForm orderForm, Model model) {

		// 香りのID(5) を使って、名前（例：Rose）を探してセットする
		if (orderForm.getScentId() != null) {
			scentRepository.findById(orderForm.getScentId())
					.ifPresent(scent -> orderForm.setScentName(scent.getName()));
		}

		// ボトルのID(2) を使って、名前（例：Round）を探してセットする
		if (orderForm.getBottleId() != null) {
			bottleRepository.findById(orderForm.getBottleId())
					.ifPresent(bottle -> orderForm.setBottleName(bottle.getName()));
		}

		// 名前がセットされた orderForm を画面に渡す
		model.addAttribute("orderForm", orderForm);
		return "order";
	}

	// 5. 完了画面へ
	@PostMapping("/complete")
	public String completeOrder(@ModelAttribute OrderForm orderForm, HttpSession session) {

		// 1. Orderエンティティを作成し、フォームの内容をコピーする
		Order order = new Order();

		// ユーザー情報のコピー
		order.setUserName(orderForm.getUserName());
		order.setPostCode(orderForm.getPostCode());
		order.setAddress(orderForm.getAddress());
		order.setPhoneNumber(orderForm.getPhoneNumber());

		// 選択された香りとボトルの「名前」をコピー
		// ※IDではなく名前を保存することで、将来商品名が変わっても注文当時の記録が残ります
		order.setScentName(orderForm.getScentName());
		order.setBottleName(orderForm.getBottleName());

		// 2. データベースへ保存
		// リポジトリのインターフェース経由で、Spring JPAがINSERT文を実行してくれます
		orderRepository.save(order);

		// 3. セッションから注文情報を削除（二重送信や戻った時の不具合防止）
		session.removeAttribute("orderForm");

		// 4. complete.html へリダイレクト（リロード対策）
		return "redirect:/complete";
	}

	/**
	 * 完了画面の表示
	 */
	@GetMapping("/complete")
	public String showCompletePage() {
		return "complete";
	}
}
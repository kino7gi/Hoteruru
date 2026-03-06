package com.example.perfume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

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

		// 簡易的なパスワードチェック（本来はDB照合が望ましい）
		if ("admin".equals(userId) && "password123".equals(password)) {
			session.setAttribute("isLoggedIn", true); // セッションに保存
			return "redirect:/admin/dashboard";
		} else {
			model.addAttribute("error", "IDまたはパスワードが違います");
			return "admin/login";
		}
	}

	// 在庫管理画面（ダッシュボード）
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session) {
		// ログインしていない場合はログイン画面へ戻す
		if (session.getAttribute("isLoggedIn") == null) {
			return "redirect:/admin/login";
		}
		return "admin/dashboard";
	}

	// ログアウト処理
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // セッションを破棄
		return "redirect:/admin/login";
	}
}
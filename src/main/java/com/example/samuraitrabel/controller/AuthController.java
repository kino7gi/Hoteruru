package com.example.samuraitrabel.controller;

//ログインのための会員登録画面用リクエスト処理

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.samuraitrabel.entity.User;
import com.example.samuraitrabel.entity.VerificationToken;
import com.example.samuraitrabel.event.SignupEventPublisher;
import com.example.samuraitrabel.form.SignupForm;
import com.example.samuraitrabel.service.UserService;
import com.example.samuraitrabel.service.VerificationTokenService;

import jakarta.servlet.http.HttpServletRequest;

@Controller

public class AuthController {
	private final UserService userService;
	public final SignupEventPublisher signupEventPublisher;
	private VerificationTokenService verificationTokenService;

	public AuthController(UserService userService, SignupEventPublisher signupEventPublisher,
			VerificationTokenService verificationTokenService) {
		this.userService = userService;
		this.signupEventPublisher = signupEventPublisher;
		this.verificationTokenService = verificationTokenService;

	}

	@GetMapping("/login")

	public String login() {
		return "auth/login";
	}

	//signupにアクセス
	@GetMapping("/signup")

	public String singup(Model model) {
		model.addAttribute("signupForm", new SignupForm());
		return "auth/signup";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute @Validated SignupForm signupForm, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {

		//メールアドレスが登録済みであれば、BindingResultオブジェクトにエラー内容を追加する。

		if (userService.isEmailRegistered(signupForm.getEmail())) {
			FieldError fieldError = new FieldError(bindingResult.getObjectName(), "email", "すでに登録済みのメールアドレスです。");
			bindingResult.addError(fieldError);
		}

		// パスワードとパスワード（確認用）の入力値が一致しなければ、BindingResultオブジェクトにエラー内容を追加する

		if (!userService.isSamePassword(signupForm.getPassword(), signupForm.getPasswordConfirmation())) {
			FieldError fieldError = new FieldError(bindingResult.getObjectName(), "password", "パスワードが一致しません。");
			bindingResult.addError(fieldError);
		}

		if (bindingResult.hasErrors()) {
			return "auth/signup";
		}

		//確認メール送信箇所
		User createdUser = userService.create(signupForm);
		signupEventPublisher.publishSignupEvent(createdUser, httpServletRequest.getRequestURL().toString());
		redirectAttributes.addFlashAttribute("successMessage",
				"会員登録が完了しました。ご入力いただいたメールアドレスに認証メールを送信しました。メールに記載されているリンクをクリックし、会員登録を完了してください。");

		//signup.htmlが動いて↑のメッセージが表示される
		return "redirect:/signup";

	}

	@GetMapping("/signup/verify")
	public String verify(@RequestParam(name = "token") String token, RedirectAttributes redirectAttributes) { // 引数名を整理
		VerificationToken verificationToken = verificationTokenService.getVerificationToken(token);

		if (verificationToken != null) {
			User user = verificationToken.getUser();
			userService.enableUser(user);

			// addAttribute ではなく addFlashAttribute を使う
			redirectAttributes.addFlashAttribute("successMessage", "会員登録が完了しました。ログインしてください。");
			return "redirect:/login";
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "トークンが無効です。");
			return "redirect:/signup";
		}
	}
}

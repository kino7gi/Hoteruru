package com.example.moattravel.controller;

//認証機能用コントローラー(ログイン、会員登録)
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.moattravel.form.SignupForm;
import com.example.moattravel.service.UserService;

@Controller
public class AuthController {

	private final UserService userService;

	public AuthController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}

	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("signupForm", new SignupForm());
		return "auth/signup";
	}

	@PostMapping("/signup")
	public String signup(@ModelAttribute @Validated SignupForm signupForm,
			//バリデーションのエラーが格納される
			BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {

		// メールアドレスが登録済みであればエラー追加
		if (userService.isEmailRegistered(signupForm.getEmail())) {
			FieldError fieldError = new FieldError(
					bindingResult.getObjectName(),
					"email",
					"すでに登録済みのメールアドレスです。");
			bindingResult.addError(fieldError);
		}

		// パスワードと確認用が一致しなければエラー追加
		if (!userService.isSamePassword(
				signupForm.getPassword(),
				signupForm.getPasswordConfirmation())) {

			FieldError fieldError = new FieldError(
					bindingResult.getObjectName(),
					"password",
					"パスワードが一致しません。");
			bindingResult.addError(fieldError);
		}

		if (bindingResult.hasErrors()) {
			return "auth/signup";
		}

		userService.create(signupForm);
		redirectAttributes.addFlashAttribute("successMessage", "会員登録が完了しました。");

		return "redirect:/";
	}
}

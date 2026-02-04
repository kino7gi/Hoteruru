package com.example.samuraitrabel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.samuraitrabel.form.SignupForm;

@Controller

public class AuthController {
	
	@GetMapping("/login")
	
	public String ligin() {
		return "auth/login";
	}
	@GetMapping("/signup")
	public String singup(Model model) {
		model.addAttribute("signupForm", new SignupForm());
		 return "auth/signup";
	}

}

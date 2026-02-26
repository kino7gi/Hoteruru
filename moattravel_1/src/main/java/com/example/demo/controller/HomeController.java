package com.example.demo.controller;
//１ホーム画面のコントローラー
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")//アプリのトップページにアクセスされた時にそのメソッドが実行されるようになる
	public String index() {
		//templates/indexが呼び出される
		return "index";
	}

}
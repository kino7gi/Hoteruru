package com.example.moattravel.controller;
//templates.indexのコントローラー

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller //コントローラーとして機能するようになる
public class HomeController {

	@GetMapping("/")//URL/がきたら
	public String index() {//index()を実行
		return "index";//indexに返っていく
	}

}

package com.yori.zori.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	
	@RequestMapping("/")
	public String index() {
		return "main";
	}
	@RequestMapping("login")
	public String login() {
		return "login";
	}
}

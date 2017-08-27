package com.cloudST.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	@GetMapping("/")
	public String getIndex (Model model){
		
		return "index";
	}
	
	@GetMapping("/welcome")
	public String getInicio(Model model){
		
		return "welcome";
	}
}

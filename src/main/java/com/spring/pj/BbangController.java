package com.spring.pj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class BbangController {

	
	@GetMapping("/login")
	public String login() {
		
		return "/user/login";
	}
}

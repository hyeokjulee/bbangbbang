package com.spring.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SecurityController {
	@GetMapping("/login")
	public String loginMethod() {
		return "login";
	}
	
	@GetMapping("/loginfailed")
	public String loginfailedMethod() {
		return "loginfailed";
	}
	
	@GetMapping("/logout")
	public String logoutMethod() {
		return "logout";
	}
}

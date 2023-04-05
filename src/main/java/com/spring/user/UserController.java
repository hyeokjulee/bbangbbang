package com.spring.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {
	@RequestMapping("/login")
	public String loginMethod() {
		
		return "login";
	}
	
	@GetMapping("/loginfailed")
	public String loginfailedMethod() {
		
		return "login";
	}
	
	@GetMapping("/logout")
	public String logoutMethod() {
		
		return "login";
	}
	
	@GetMapping("/join")
	public String joinMethod() {
		
		return "join";
	}
	
	@GetMapping("/myEdit")
	public String myEditMethod() {
		
		return "myEdit";
	}
	
	@GetMapping("/userEdit")
	public String userEditMethod() {
		
		return "userEdit";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute @Valid User user, BindingResult result) { // binding한 결과가 result에 담긴다.
		if( result.hasErrors() ) { // 에러가 있는지 검사
			List<ObjectError> list = result.getAllErrors(); // 에러를 List로 저장
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "join";
		}
		
//		userService.join(user);
		
		return "redirect:/joinsuccess";
	}
	
}

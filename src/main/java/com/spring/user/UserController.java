package com.spring.user;

import java.util.List;

import javax.validation.Valid;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("user")
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/join")
	public String joinMethod(@ModelAttribute User user) {
		return "join";
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
		
		String encodedPassword = bcryptPasswordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		userService.createUser(user);
		
		return "redirect:/user/login";
	}
	
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
	
	@GetMapping("/myEdit")
	public String myEditMethod() {
		
		return "myEdit";
	}
	
	@GetMapping("/userEdit")
	public String userEditMethod() {
		
		return "userEdit";
	}
}
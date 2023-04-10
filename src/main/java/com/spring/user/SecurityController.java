package com.spring.user;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SecurityController {
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	
	@GetMapping("/join")
	public String joinMethod(@ModelAttribute User user) {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(@Validated @ModelAttribute("user") JoinUser joinUser, BindingResult result) { // binding한 결과가 result에 담긴다.
		if( result.hasErrors() ) { // 에러가 있는지 검사
			List<ObjectError> list = result.getAllErrors(); // 에러를 List로 저장
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "join";
		}
		
		if (!joinUser.getPassword().equals(joinUser.getPasswordCheck())) {
			result.rejectValue("passwordCheck", "error.joinUser", "비밀번호가 일치하지 않습니다.");
	        return "join";
	    }
		
		User userParam = new User();
		String encodedPassword = bcryptPasswordEncoder.encode(joinUser.getPassword());
		userParam.setPassword(encodedPassword);
		userParam.setUname(joinUser.getUname());
		userParam.setUname(joinUser.getUname());
		
		userParam.setUsername(joinUser.getUsername());
		userService.createUser(userParam);
		
		return "redirect:/";
	}
}
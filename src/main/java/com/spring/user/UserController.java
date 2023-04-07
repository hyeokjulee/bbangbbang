package com.spring.user;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
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
	public String join(@Validated @ModelAttribute("user") JoinUser joinUser, BindingResult result) { // binding한 결과가 result에 담긴다.
		if( result.hasErrors() ) { // 에러가 있는지 검사
			List<ObjectError> list = result.getAllErrors(); // 에러를 List로 저장
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "join";
		}
		
		User userParam = new User();
		String encodedPassword = bcryptPasswordEncoder.encode(joinUser.getPassword());
		userParam.setPassword(encodedPassword);
		userParam.setUname(joinUser.getUname());
		userParam.setUsername(joinUser.getUsername());
		
		userService.createUser(userParam);
		
		return "redirect:/";
	}
	
	@GetMapping("/myEdit") // 내정보수정
	public String myEditMethod(@ModelAttribute User user, Authentication auth) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User findedUser = userService.getUser(username);
        user.setUsername(username);
        user.setUname(findedUser.getUname());
        user.setUid(findedUser.getUid());
		
		return "myEdit";
	}
	
	@PostMapping("/myEdit") // 내정보수정
	public String myEdit(@Validated @ModelAttribute("user") JoinUser joinUser, BindingResult result) { // binding한 결과가 result에 담긴다.
		if( result.hasErrors() ) { // 에러가 있는지 검사
			List<ObjectError> list = result.getAllErrors(); // 에러를 List로 저장
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "myEdit";
		}
		
		User userParam = new User();
		String encodedPassword = bcryptPasswordEncoder.encode(joinUser.getPassword());
		userParam.setPassword(encodedPassword);
		userParam.setUname(joinUser.getUname());
		userParam.setUsername(joinUser.getUsername());
		userParam.setUid(joinUser.getUid());
		
		userService.modifyUser(userParam);
		
		return "redirect:/";
	}
}
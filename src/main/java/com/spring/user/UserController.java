package com.spring.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("user")
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final CustomLogoutHandler customLogoutHandler;
	
	@GetMapping("/myEdit") // 내정보수정
	public String myEditMethod(@ModelAttribute User user, Authentication auth) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User findedUser = userService.getUser(username);
        user.setUsername(username);
        user.setUname(findedUser.getUname());
        user.setUid(findedUser.getUid());
		
		return "user/myEdit";
	}
	
	@PostMapping("/myEdit") // 내 비밀번호변경
	public String myEdit(@Validated @ModelAttribute("user") EditUser editUser, BindingResult result) { // binding한 결과가 result에 담긴다.
		if( result.hasErrors() ) { // 에러가 있는지 검사
			List<ObjectError> list = result.getAllErrors(); // 에러를 List로 저장
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "user/myEdit";
		}
		
		if (!editUser.getPassword().equals(editUser.getPasswordCheck())) {
			result.rejectValue("passwordCheck", "error.editUser", "비밀번호가 일치하지 않습니다.");
	        return "user/myEdit";
	    }
		
		User userParam = new User();
		String encodedPassword = bcryptPasswordEncoder.encode(editUser.getPassword());
		userParam.setPassword(encodedPassword);
		userParam.setUid(editUser.getUid());
		
		userService.modifyUser(userParam);
		
		return "redirect:/";
	}
	
	@PostMapping("/myDelete") // 회원탈퇴
	public String myDelete(@RequestParam("username") String username, HttpServletRequest request, HttpServletResponse response) {
		userService.removeUser(username); // 삭제
		customLogoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication()); // 로그아웃
        return "redirect:/login"; // 로그인페이지로
	}
}
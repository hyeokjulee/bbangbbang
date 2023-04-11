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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {
	private final UserService userService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/list") // 회원목록
	public String userList(@ModelAttribute User user) {
		return "admin/userList";
	}
	
	@GetMapping("/edit") // 회원수정
	public String userEditMethod(@ModelAttribute User user, @RequestParam int uid) {
        User findedUser = userService.getUserByuid(uid);
        user.setUname(findedUser.getUname());
        user.setUsername(findedUser.getUsername());
		return "admin/userEdit";
	}
	
	@PostMapping("/edit") // 회원 비밀번호변경
	public String userEdit(@Validated @ModelAttribute("user") EditUser editUser, BindingResult result) { // binding한 결과가 result에 담긴다.
		if( result.hasErrors() ) { // 에러가 있는지 검사
			List<ObjectError> list = result.getAllErrors(); // 에러를 List로 저장
			for( ObjectError error : list ) {
				System.out.println(error);
			}
			return "admin/userEdit";
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
		
		return "redirect:/admin/list";
	}
}
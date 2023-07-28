package com.spring.user;

import java.util.List;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("admin")
@RequiredArgsConstructor
public class restController {
	private final UserService userService;
	
	@PostMapping("/remove")
	@ResponseBody
	public int removeUser(@RequestParam("username") String username) {
		if (userService.removeUser(username)) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@PostMapping("/list")
	@ResponseBody
	public List<User> selectList() {
		return userService.getUserList();
	}
}
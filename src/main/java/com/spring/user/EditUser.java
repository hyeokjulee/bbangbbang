package com.spring.user;

import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditUser {
	private int uid, enabled;
	private String authority, udate, username, uname;

	@Size(min = 4, max = 20, message = "4 ~ 20의 길이로 입력 바랍니다.")
	private String password, passwordCheck;
}
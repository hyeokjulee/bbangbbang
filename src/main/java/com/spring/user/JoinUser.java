package com.spring.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JoinUser {
	private int uid, enabled;
	private String authority, udate;

	@NotBlank(message = "이메일을 입력해주세요.")
	@Email(message = "이메일 형식에 맞게 입력 바랍니다.")
	private String username;

	@Size(min = 4, max = 20, message = "4 ~ 20의 길이로 입력 바랍니다.")
	private String password, passwordCheck;
	
	@NotBlank(message = "이름을 입력해주세요.")
	private String uname;
}
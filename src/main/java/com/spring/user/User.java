package com.spring.user;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int uid, enabled;
	private String gender, authority, udate;

	@NotNull
	@NotEmpty(message = "이메일 형식에 맞게 입력 바랍니다.")
	@Email(message = "이메일 형식에 맞게 입력 바랍니다.")
	private String username;

	@NotNull
	@NotEmpty(message = "이메일 형식에 맞게 입력 바랍니다.")
	@Size(min = 4, max = 20, message = "4 ~ 20의 길이로 입력 바랍니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}")
	private String password, passwordCheck;
	
	@NotNull
	@NotEmpty(message = "이메일 형식에 맞게 입력 바랍니다.")
	private String uname;
}
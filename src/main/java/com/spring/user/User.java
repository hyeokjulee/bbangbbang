package com.spring.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class User {
	private int uid, enabled;
	private String gender, authority, udate;

	@NotEmpty
	@Email
	private String username;

	@NotEmpty
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}")
	private String password;
	
	@NotEmpty
	@Size(min = 2, max = 5)
	private String uname;
}
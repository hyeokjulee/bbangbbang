package com.spring.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int uid, enabled;
	private String gender, authority, udate, username, password, passwordCheck, uname;
	
	
}
package com.spring.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private int mid;

	private String username, password, authority, mname, mnickname, mphone, mdate;

}

package com.spring.user;

import java.util.List;

public interface UserRepository {

	int insertUser(User user);

	User selectUser(String username);
	
	List<User> selectUserList();
	
	int updateUser(User user);
	
	int deleteUser(String username);
}
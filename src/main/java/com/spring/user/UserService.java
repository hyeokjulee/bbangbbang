package com.spring.user;

import java.util.List;

public interface UserService {

	boolean createUser(User user);
	
	User getUser(String username);
	
	List<User> getUserList();
	
	boolean modifyUser(User user);
	
	boolean removeUser(String username);
}
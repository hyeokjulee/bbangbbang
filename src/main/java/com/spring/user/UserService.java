package com.spring.user;

import java.util.List;

public interface UserService {

	boolean createUser(User user);
	
	User getUser(String username);
	
	User getUserByuid(int uid);
	
	List<User> getUserList();
	
	boolean modifyUser(User user);
	
	boolean removeUser(String username);
}
package com.spring.user;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserRepository UserRepository;

	@Override
	public boolean createUser(User user) {
		return (UserRepository.insertUser(user) != 0) ? true : false;
	}

	@Override
	public User getUser(String username) {
		return UserRepository.selectUser(username);
	}
	
	@Override
	public User getUserByuid(int uid) {
		return UserRepository.selectUserByuid(uid);
	}

	@Override
	public List<User> getUserList() {
		return UserRepository.selectUserList();
	}

	@Override
	public boolean modifyUser(User user) {
		return (UserRepository.updateUser(user) != 0) ? true : false;
	}

	@Override
	public boolean removeUser(String username) {
		return (UserRepository.deleteUser(username) != 0) ? true : false;
	}
}

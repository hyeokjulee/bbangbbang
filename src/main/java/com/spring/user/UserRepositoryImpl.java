package com.spring.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserRepositoryImpl implements UserRepository {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertUser(User user) {
		int result = this.sqlSessionTemplate.insert("user.insert", user);
		return result;
	}

	@Override
	public User selectUser(String username) {
		return this.sqlSessionTemplate.selectOne("user.select", username);
	}
	
	@Override
	public User selectUserByuid(int uid) {
		return this.sqlSessionTemplate.selectOne("user.select_byuid", uid);
	}

	@Override
	public List<User> selectUserList() {
		return this.sqlSessionTemplate.selectList("user.select_list");
	}

	@Override
	public int updateUser(User user) {
		return this.sqlSessionTemplate.update("user.update", user);
	}

	@Override
	public int deleteUser(String username) {
		return this.sqlSessionTemplate.delete("user.delete", username);
	}
}
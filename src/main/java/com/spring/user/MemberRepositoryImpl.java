package com.spring.user;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberRepositoryImpl implements MemberRepository {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertMember(Member member) {
		int result = this.sqlSessionTemplate.insert("members.insert", member);
		return result;
	}

	@Override
	public Member selectMember(String username) {
		return this.sqlSessionTemplate.selectOne("members.select", username);
	}

	@Override
	public List<Member> selectMemberList() {
		return this.sqlSessionTemplate.selectList("members.select_list");
	}

	@Override
	public int updateMember(Member member) {
		return this.sqlSessionTemplate.update("members.update", member);
	}

	@Override
	public int deleteMember(String username) {
		return this.sqlSessionTemplate.delete("members.delete", username);
	}
	
}

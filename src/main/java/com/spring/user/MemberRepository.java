package com.spring.user;

import java.util.List;
import java.util.Map;

public interface MemberRepository {

	int insertMember(Member member);

	Member selectMember(String username);
	
	List<Member> selectMemberList();
	
	int updateMember(Member member);
	
	int deleteMember(String username);
	
}

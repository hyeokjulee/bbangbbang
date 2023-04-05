package com.spring.user;

import java.util.List;
import java.util.Map;


public interface MemberService {

	boolean createMember(Member member);
	
	Member getMember(String username);
	
	List<Member> getMemberList();
	
	boolean modifyMember(Member member);
	
	boolean removeMember(String username);

	
}

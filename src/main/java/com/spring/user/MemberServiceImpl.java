package com.spring.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepository;

	@Override
	public boolean createMember(Member member) {
		return (memberRepository.insertMember(member) != 0) ? true : false;
	}

	@Override
	public Member getMember(String username) {
		return memberRepository.selectMember(username);
	}

	@Override
	public List<Member> getMemberList() {
		return memberRepository.selectMemberList();
	}

	@Override
	public boolean modifyMember(Member member) {
		return (memberRepository.updateMember(member) != 0) ? true : false;
	}

	@Override
	public boolean removeMember(String username) {
		return (memberRepository.deleteMember(username) != 0) ? true : false;
	}
}

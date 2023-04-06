package com.spring.notice;

public interface NoticeService {

	void setNewNotice(Notice notice);	//등록

	Notice getNoticeById(String nid);	//소개글 보기
}

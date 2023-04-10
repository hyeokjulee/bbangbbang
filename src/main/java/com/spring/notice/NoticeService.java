package com.spring.notice;

import java.util.List;
import java.util.Map;


public interface NoticeService {

	void setNewNotice(Notice notice);	//등록

	List<Notice> getAllNoticeList();	//소개글 목록

	Notice getNoticeById(String nid);	//소개글 보기
	
	void checkNotice(Map map);	//조회수

	void setUpdateNotice(Notice notice);	//소개글 수정

	void deleteNotice(Map<String, Object> map);	//소개글 삭제

}

package com.spring.notice;

import com.spring.board.Board;

public interface NoticeRepository {

	void setNewNotice(Notice notice);	//등록
	
	Notice getNoticeById(String nid);	//소개글 보기
}

package com.spring.board;

import java.util.List;
import java.util.Map;


public interface BoardRepository {

	void setNewBoard(Board board);	//게시물 등록
	
	List<Board> getAllBoardList();	//게시물 목록
	
	Board getBoardById(String bid);	//게시물 상세보기
	
	void replynewBoard(Map<String, Object> map);	//댓글 등록
//	void replynewBoard(Board board);	//댓글 등록
	
	List<Comment> getReplyById(String bid);	//댓글 목록
	
	void checkBoard(Map map);	//조회수
	
	void updateBoard(Board board);	//게시물 수정
	
	// int deleteBoard(String bid);	

	void deleteBoard(Map<String, Object> map);	//게시물 삭제
	
	void deleteReply(String cid);	//댓글 삭제
	
	void updateReply(Map<String, Object> map);	//댓글 수정
}

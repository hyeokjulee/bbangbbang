package com.spring.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	void setNewBoard(Board board);	//게시물 등록
		
	List<Board> getAllBoardList();	//게시물 목록
	
	Board getBoardById(String bid);	//게시물 상세보기
	
	void replynewBoard(Map map);	//댓글 등록
	
	List<Board> getReplyById(String bid);	//댓글 목록
	
	void checkBoard(Map map);	//조회수
	
	int updateBoard(Board board);	//게시물 수정
	
	int deleteBoard(String bid);	//게시물 삭제
}

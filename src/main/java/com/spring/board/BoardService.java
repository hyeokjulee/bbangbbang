package com.spring.board;

import java.util.List;

public interface BoardService {

	void setNewBoard(Board board);	//게시물 등록
		
	List<Board> getAllBoardList();	//게시물 목록
	
	Board getBoardById(String bid);	//게시물 상세보기
}

package com.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardRepository boardRepository;

	@Override
	public void setNewBoard(Board board) {
		boardRepository.setNewBoard(board);
	}

	@Override
	public List<Board> getAllBoardList() {
		return boardRepository.getAllBoardList();
	}

	@Override
	public Board getBoardById(String bid) {
		return boardRepository.getBoardById(bid);
	}

}

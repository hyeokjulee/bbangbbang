package com.spring.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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

	public Board getBoardById(String bid) {
		return boardRepository.getBoardById(bid);
	}

	public void replynewBoard(Map map) {
		boardRepository.replynewBoard(map);
	}
	
	public List<Board> getReplyById(String bid) {
		return boardRepository.getReplyById(bid);
	}
	
	public void checkBoard(Map map) {
		boardRepository.checkBoard(map);
	}
	
	@Override
	public int updateBoard(Board board) {
		return boardRepository.updateBoard(board);
	}

	@Override
	public int deleteBoard(String bid) {
		return boardRepository.deleteBoard(bid);
	}

}

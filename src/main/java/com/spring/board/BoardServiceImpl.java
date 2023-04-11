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

	public void replynewBoard(Map<String, Object> map) {
		boardRepository.replynewBoard(map);
	}
	
//	@Override
//	public void replynewBoard(Board board) {
//		boardRepository.replynewBoard(board);
//	}
	
	public List<Board> getReplyById(String bid) {
		return boardRepository.getReplyById(bid);
	}
	
	public void checkBoard(Map map) {
		boardRepository.checkBoard(map);
	}
	
	@Override
	public void updateBoard(Board board) {
		boardRepository.updateBoard(board);
	}

//	@Override
//	public int deleteBoard(String bid) {
//		return boardRepository.deleteBoard(bid);
//	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		 boardRepository.deleteBoard(map);
		
	}


}

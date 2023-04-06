package com.spring.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardRepositoryImpl implements BoardRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void setNewBoard(Board board) {
		this.sqlSessionTemplate.insert("board.insert", board);
	}

	@Override
	public List<Board> getAllBoardList() {
		return this.sqlSessionTemplate.selectList("board.select_list");
	}

	@Override
	public Board getBoardById(String bid) {
		return this.sqlSessionTemplate.selectOne("board.select_detail", bid);
	}

}

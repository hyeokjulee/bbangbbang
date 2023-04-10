package com.spring.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
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

	public void replynewBoard(Map<String, Object> map) {
		this.sqlSessionTemplate.insert("board.insert_reply", map);
	}
	
//	@Override
//	public void replynewBoard(Board board) {
//		this.sqlSessionTemplate.insert("board.insert_reply", board);
//	}

	
	
	public List<Board> getReplyById(String bid) {
		return this.sqlSessionTemplate.selectList("board.select_reply", bid);
	}
	
	public void checkBoard(Map map) {
		String check = (String)map.get("check");
		
//		System.out.println("조건1 : " + check);
		
		
		if (check.equals("bview")){
			this.sqlSessionTemplate.update("board.update_view", map);
		}
	}

	@Override
	public void updateBoard(Board board) {
		this.sqlSessionTemplate.update("board.update", board);
	}

//	@Override
//	public int deleteBoard(String bid) {
//		return this.sqlSessionTemplate.delete("board.delete", bid);
//	}

	@Override
	public void deleteBoard(Map<String, Object> map) {
		this.sqlSessionTemplate.delete("board.delete", map);
		
	}




}

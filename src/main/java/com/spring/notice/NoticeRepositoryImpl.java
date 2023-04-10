package com.spring.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.Board;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public void setNewNotice(Notice notice) {
		this.sqlSessionTemplate.insert("notice.insert", notice);
	}

	@Override
	public List<Notice> getAllNoticeList() {
		return this.sqlSessionTemplate.selectList("notice.select_list");
	}

	@Override
	public Notice getNoticeById(String nid) {
		return this.sqlSessionTemplate.selectOne("notice.select_detail", nid);
	}

	public void checkNotice(Map map) {
		String check = (String)map.get("check");
		
//		System.out.println("조건1 : " + check);
		
		
		if (check.equals("nview")){
			this.sqlSessionTemplate.update("notice.update_view", map);
		}
	}

	@Override
	public void setUpdateNotice(Notice notice) {
		this.sqlSessionTemplate.update("notice.update", notice);
		
	}

	@Override
	public void deleteNotice(Map<String, Object> map) {
		this.sqlSessionTemplate.delete("notice.delete", map);
	}

}

package com.spring.notice;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public void setNewNotice(Notice notice) {
		this.sqlSessionTemplate.insert("notice.insert", notice);
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
	public int modifyNotice(Notice notice) {
		return this.sqlSessionTemplate.update("notice.update", notice);
	}


	@Override
	public int removeNotice(String nid) {
		return this.sqlSessionTemplate.delete("notice.delete", nid);
	}
}

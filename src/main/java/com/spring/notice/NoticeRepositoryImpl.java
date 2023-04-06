package com.spring.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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

}

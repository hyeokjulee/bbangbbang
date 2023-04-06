package com.spring.notice;

import org.springframework.beans.factory.annotation.Autowired;


public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeRepository noticeRepository;
	
	@Override
	public void setNewNotice(Notice notice) {
		noticeRepository.setNewNotice(notice);
	}

	@Override
	public Notice getNoticeById(String nid) {
		return noticeRepository.getNoticeById(nid);
	}
}

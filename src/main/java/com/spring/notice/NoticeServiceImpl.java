package com.spring.notice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
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

	@Override
	public void checkNotice(Map map) {
		noticeRepository.checkNotice(map);		
	}
}

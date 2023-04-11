package com.spring.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.Board;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeRepository noticeRepository;
	
	@Override
	public void setNewNotice(Notice notice) {
		noticeRepository.setNewNotice(notice);
	}

	@Override
	public List<Notice> getAllNoticeList() {
		return noticeRepository.getAllNoticeList();
	}
	
	@Override
	public Notice getNoticeById(String nid) {
		return noticeRepository.getNoticeById(nid);
	}

	@Override
	public void setUpdateNotice(Notice notice) {
		noticeRepository.setUpdateNotice(notice);
	}
	
	@Override
	public void checkNotice(Map map) {
		noticeRepository.checkNotice(map);		
	}


	@Override
	public void deleteNotice(Map<String, Object> map) {
		noticeRepository.deleteNotice(map);
	}

	
	
}

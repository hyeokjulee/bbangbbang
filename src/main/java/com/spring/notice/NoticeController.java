package com.spring.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/notices")
public class NoticeController {

	@Autowired 
	private NoticeService noticeService;
	
	@GetMapping("/noticeadd")
	public String requestAddNoticeForm(@ModelAttribute("NewNotice") Notice notice) {
		
		return "notices/noticeadd";
	}
	
	@GetMapping("/notice")
	public String requestNoticeById(@RequestParam("nid") String nid, Model model) {
		//주 게시물
		Notice noticeById = noticeService.getNoticeById(nid);
		model.addAttribute("notice", noticeById);
		
		return "notices/notice";
	}
	
	
}

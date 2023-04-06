package com.spring.notice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.Board;

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
		
		// 폼을 띄우기 전에 조회수 하나 증가
		
		Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("check","nview");
			map.put("nid",nid);
		
		noticeService.checkNotice(map);
		
		return "notices/notice";
	}
	
	@ResponseBody
	@RequestMapping("/check")
	public void checkNotice(@RequestParam Map<String, Object> map) {
		
		System.out.println(map.get("check"));
		System.out.println(map);
		noticeService.checkNotice(map);

		
	}
	
	 //소개글 수정 페이지로 이동
    @GetMapping("/modify")
    public void noticeModifyGET(@RequestParam("nid") String nid, Model model) {
        
        model.addAttribute("pageInfo", noticeService.getNoticeById(nid));
        
    }
    
    //소개글 수정
    @PostMapping("/modify")
    public String noticeModifyPOST(Notice notice, RedirectAttributes rttr) {
        
        noticeService.modifyNotice(notice);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/notices/notice";
        
    }
    
    //소개글 삭제
    @PostMapping("/remove")
    public String noticeRemovePOST(@RequestParam("nid") String nid, RedirectAttributes rttr) {
        
    	noticeService.removeNotice(nid);
        
        rttr.addFlashAttribute("result", "remove success");
        
        return "redirect:/notices/notice";
    }
    
}

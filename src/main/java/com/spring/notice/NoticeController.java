package com.spring.notice;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/notices")
public class NoticeController {

	@Autowired 
	private NoticeService noticeService;
	
	@GetMapping("/noticeadd")
	public String requestAddNoticeForm(@ModelAttribute("NewNotice") Notice notice) {
		
		return "notices/noticeadd";
	}
	
//	관리자만 등록가능하게 	
//	@PostMapping("/noticeadd")
//	public String submitAddNoticeForm(@ModelAttribute("NewNotice") Notice notice, Principal principal) {
//	    String username = principal.getName();
//	    if (!username.equals("admin")) {
//	        return "redirect:/notices/noticelist";
//	    }
//	    noticeService.setNewNotice(notice);
//
//	    System.out.println(notice.getNcontent());
//	    System.out.println(notice.getNtitle());
//	    System.out.println(notice.getNid());
//
//	    return "redirect:/notices/noticelist";
//	}

	
	@PostMapping("/noticeadd")
	public String submitAddNoticeForm(@ModelAttribute("NewNotice") Notice notice ) {

		noticeService.setNewNotice(notice);
		
		System.out.println(notice.getNcontent());
		System.out.println(notice.getNtitle());
		System.out.println(notice.getNid());
		
		
		return "redirect:/notices/noticelist";
	}
	
	@GetMapping("/noticelist")
	public String noticeList(Model model) {
	    List<Notice> list = noticeService.getAllNoticeList();
	    model.addAttribute("noticeList", list);

	    return "notices/noticelist";
	}

	
	@GetMapping("/notice")
	public String requestNoticeById(@RequestParam(value="nid", required = false) String nid, Model model) {
		//주 게시물
		Notice noticeById = noticeService.getNoticeById(nid);
		model.addAttribute("notice", noticeById);
		
		// 폼을 띄우기 전에 조회수 하나 증가
		
		Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("check","nview");
			map.put("nid", nid);
		
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
    //경외---------------------
    @GetMapping("/noticeupdate")
	public String requestUpdateNoticeForm(@ModelAttribute("UpdateNotice") Notice notice, @RequestParam(value = "nid") String nid, Model model) {
    	
    	Notice noticeById = noticeService.getNoticeById(nid);
		model.addAttribute("notice", noticeById);
		
		return "notices/noticeupdate";
	}
    //경외---------------------
    
    //소개글 수정
    @PostMapping("/noticeupdate")
	public String submitUpdateNoticeForm(@RequestParam(value = "nid", required = false) String nid, @ModelAttribute("UpdateNotice") Notice notice ) {

		noticeService.setUpdateNotice(notice);
		
		System.out.println(notice.getNcontent());
		System.out.println(notice.getNtitle());
		System.out.println(notice.getNid());
		
		
		return "redirect:/notices/noticelist";
	}
    
//    @GetMapping("/noticeupdate")
//    public void noticeModifyGET(@RequestParam("nid") String nid, Model model) {
//        
//        model.addAttribute("pageInfo", noticeService.getNoticeById(nid));
//        
//    }
   
//    @PostMapping("/modify")
//    public String noticeModifyPOST(Notice notice, RedirectAttributes rttr) {
//        
//        noticeService.modifyNotice(notice);
//        
//        rttr.addFlashAttribute("result", "modify success");
//        
//        return "redirect:/notices/notice";
//        
//    }
    
    //소개글 삭제
//    @PostMapping("/remove")
//    public String noticeRemovePOST(@RequestParam("nid") String nid, RedirectAttributes rttr) {
//        
//    	noticeService.removeNotice(nid);
//        
//        rttr.addFlashAttribute("result", "remove success");
//        
//        return "redirect:/notices/notice";
//    }

    @PostMapping("/deletenotice")
	public ModelAndView deletePost(@RequestParam Map<String, Object> map) {  

	noticeService.deleteNotice(map);

	ModelAndView mav = new ModelAndView("redirect:/notices/noticelist");  
	
	return mav;  

   }
    
}

package com.spring.board;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.notice.Notice;


@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Autowired 
	private BoardService boardService;
	
	@GetMapping("/boardadd")
	public String requestAddBoardForm(@ModelAttribute("NewBoard") Board board) {
		
		return "boards/boardadd";
	}
	
	@PostMapping("/boardadd")
	public String submitAddBoardForm(@ModelAttribute("NewBoard") Board board) {

		boardService.setNewBoard(board);
		
		System.out.println(board.getBcontent());
		System.out.println(board.getBtitle());
		
		
		return "redirect:/boards/boardlist";
	}
	
	@GetMapping("/boardlist")
	public String BoardList(Model model) {
	    List<Board> list = boardService.getAllBoardList();
	    model.addAttribute("boardList", list);

	    return "boards/boardlist";
	}
	
	@GetMapping("/board")
	public String requestBoardById(@RequestParam String bid, Model model, Authentication auth) {
		//주 게시물
		Board boardById = boardService.getBoardById(bid);
		model.addAttribute("board", boardById);
		
		// 답변 게시물
				List<Comment> list = boardService.getReplyById(bid);
				int cnt = list.size();
				model.addAttribute("commentList",list);
				model.addAttribute("cnt", cnt);
				
				if (auth == null) {
				} else if (auth.getName().equals(boardService.getBoardById(bid).getBwriter())) {
					model.addAttribute("flag", true);
		    	} else if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
					model.addAttribute("flag", true);
		    	}
				
				// 폼을 띄우기 전에 조회수 하나 증가
				
				Map<String, Object> map = new HashMap<String, Object>();
				
					map.put("check","bview");
					map.put("bid",bid);
				
				boardService.checkBoard(map);
		
		return "boards/board";
	}
	
	@ResponseBody
	@PostMapping("/replynew")
	public void replynew(@RequestParam Map<String, Object> map) {
		
		System.out.println("컨트롤러로 넘어오나??");
		
		
		System.out.println(map.get("bid"));
		System.out.println(map.get("ccontent"));
		System.out.println(map.get("cwriter"));


		boardService.replynewBoard(map);

	}
	
	@ResponseBody
	@RequestMapping("/check")
	public void checkBoard(@RequestParam Map<String, Object> map) {
		
		System.out.println(map.get("check"));
		System.out.println(map);
		boardService.checkBoard(map);
		
	}
	
	 //게시물 수정 페이지로 이동
    @GetMapping("/boardupdate")
    public String boardUpdateGET(@ModelAttribute("UpdateBoard") Board board, @RequestParam String bid, Model model, Authentication auth) {
    	if (auth == null) {
            return "login";
        } else if (!auth.getName().equals(boardService.getBoardById(bid).getBwriter()) && !auth.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))) {
        	return "redirect:/boards/board?bid=" + bid;
    	}
    	
    	Board boardById = boardService.getBoardById(bid);
        model.addAttribute("board", boardById);
        return "boards/boardupdate";
    }
    
    //게시물 수정
    @PostMapping("/boardupdate")
	public String boardUpdatePOST(@RequestParam(value = "bid", required = false) String bid, @ModelAttribute("UpdateBoard") Board board) {
		
    	boardService.updateBoard(board);

//    	Board boardById = boardService.getBoardById(bid);
//         model.addAttribute("board", boardById);
//         boardById.setBtitle(board.getBtitle());
//         boardById.setBcontent(board.getBcontent());
         
         System.out.println(board.getBcontent());
 		System.out.println(board.getBtitle());
 		System.out.println(board.getBid());
         
         return "redirect:/boards/boardlist";
         
	}
	
    
    
    
//    @PostMapping("/update")
//    public String boardUpdatePOST(Board board, RedirectAttributes rttr) {
//        
//        boardService.updateBoard(board);
//        
//        rttr.addFlashAttribute("result", "update success");
//        
//        return "redirect:/boards/boardlist";
//        
//    }
    
    
  
//    @PostMapping("/deleteboard")
//    public String boardDeletePOST(@RequestParam(value="bid", required = false) String bid, RedirectAttributes rttr) {
//        
//        boardService.deleteBoard(bid);
//        
//        rttr.addFlashAttribute("result", "delete success");
//        
//        return "redirect:/boards/boardlist";
//    }
    
      //게시물 삭제
    @PostMapping("/deleteboard") 
	public ModelAndView deletePost(@RequestParam Map<String, Object> map) {  

	boardService.deleteBoard(map);

	ModelAndView mav = new ModelAndView("redirect:/boards/boardlist");  
	
	return mav;  

   }
    
    //댓글 삭제
    @PostMapping("/deletereply") 
	public ModelAndView deleteReply(@RequestParam String cid, @RequestParam String bid) {  
    	
    	System.out.println(cid);
    	System.out.println(bid);

	boardService.deleteReply(cid);

	ModelAndView mav = new ModelAndView("redirect:/boards/board?bid=" + bid);  
	
	return mav;  

   }
    
    //댓글 수정
    @ResponseBody
    @RequestMapping(value = "/updatereply", method = RequestMethod.POST)
    public void updateReviewAjax(@RequestParam Map<String, Object> map) {
        System.out.println("컨트롤러 연결 확인");
        System.out.println("cid : " + map.get("cid"));
        System.out.println("ccontent : " +  map.get("ccontent"));
        
         boardService.updateReply(map);
    }

    
}

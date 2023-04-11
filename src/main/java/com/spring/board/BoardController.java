package com.spring.board;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


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
	public String requestBoardById(@RequestParam("bid") String bid, Model model) {
		//주 게시물
		Board boardById = boardService.getBoardById(bid);
		model.addAttribute("board", boardById);
		
		// 답변 게시물
				List<Comment> list = boardService.getReplyById(bid);
				int cnt = list.size();
				model.addAttribute("commentList",list);
				model.addAttribute("cnt", cnt);
				
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
    public String boardUpdateGET(@ModelAttribute("UpdateBoard") Board board, @RequestParam(value="bid", required = false) String bid, Model model) {
    	
    	Board boardupdate = boardService.getBoardById(bid);
    	
        model.addAttribute("pageInfo", boardService.getBoardById(bid));
        
        return "boards/boardupdate";
    }
    
    //게시물 수정
    @PostMapping("/boardupdate")
	public String boardUpdatePOST(@ModelAttribute("UpdateBoard") Board board, @RequestParam(value= "bid", required = false) String bid, @RequestParam("btitle") String btitle, @RequestParam("bcontent") String bcontent, Model model) {
		
         Board boardById = boardService.getBoardById(bid);
         model.addAttribute("board", boardById);
         boardById.setBtitle(board.getBtitle());
         boardById.setBcontent(board.getBcontent());
         boardService.updateBoard(board);
         
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

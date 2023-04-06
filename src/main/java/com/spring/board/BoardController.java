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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Autowired 
	private BoardService boardService;
	
	@GetMapping("/boardadd")
	public String requestAddBoardForm(@ModelAttribute("NewBoard") Board board) {
		
		return "boards/boardadd";
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
				List<Board> list = boardService.getReplyById(bid);
				int cnt = list.size();
				model.addAttribute("replyList",list);
				model.addAttribute("cnt", cnt);
				
				// 폼을 띄우기 전에 조회수 하나 증가
				
				Map<String, Object> map = new HashMap<String, Object>();
				
					map.put("check","bview");
					map.put("bid",bid);
				
				boardService.checkBoard(map);
		
		return "boards/board";
	}
	
	@ResponseBody
	@RequestMapping("/replynew")
	public void replynew(@RequestParam Map<String, Object> map) {
		
		String rpid = (String)map.get("rpwriter");
		String bpid = (String)map.get("bpwriter");

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
    @GetMapping("/update")
    public void boardUpdateGET(@RequestParam("bid") String bid, Model model) {
        
        model.addAttribute("pageInfo", boardService.getBoardById(bid));
        
    }
    
    //게시물 수정
    @PostMapping("/update")
    public String boardModifyPOST(Board board, RedirectAttributes rttr) {
        
        boardService.updateBoard(board);
        
        rttr.addFlashAttribute("result", "update success");
        
        return "redirect:/boards/boardlist";
        
    }
    
    //게시물 삭제
    @PostMapping("/delete")
    public String boardDeletePOST(@RequestParam("bid") String bid, RedirectAttributes rttr) {
        
        boardService.deleteBoard(bid);
        
        rttr.addFlashAttribute("result", "delete success");
        
        return "redirect:/boards/boardlist";
    }
    
}

package com.spring.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


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
		
		return "boards/board";
	}
}

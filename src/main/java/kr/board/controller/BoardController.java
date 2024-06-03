package kr.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

// Handler Mapping이 Controller(POJO)를 찾기위해
// @(어노테이션)으로 Controller이라고 명시해야 한다
@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;

//	@RequestMapping("/boardMain.do")
//	public String main() {
//		return "board/boardMain";
//	}
	
	@GetMapping("boardList.do")
	public String boardList(Model model) {
				
		List<Board> list = boardMapper.boardList();
		
		model.addAttribute("list",list); //model에다가 잠깐 값을 담아서 간다.
		
		return "board/boardMain";
	}
	
	@GetMapping("boardContent.do")
	public String boardContent(@RequestParam("b_idx") int b_idx, Model model) {
		// 조회수
		//boardMapper.boardCount(b_idx);
		Board vo = boardMapper.boardContent(b_idx);
		model.addAttribute("vo",vo);
		//System.out.println(vo.toString()); //=> 값이 잘 있난 확인
		return "board/boardContent";
		
	} 
	
	@GetMapping("boardForm.do")
	public String boardForm() {
		return "board/boardForm";
	}

}






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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 게시판 전체 리스트
	@GetMapping("boardList.do")
	public String boardList(Model model) {
				
		List<Board> list = boardMapper.boardList();
		System.out.println("게시글의 갯수:  "+ list.size());
		model.addAttribute("list",list); //model에다가 잠깐 값을 담아서 간다.
		return "board/boardMain";
	}
	
	@GetMapping("boardContent.do")
	public String boardContent(@RequestParam("b_idx") int b_idx, Model model) {
		// 조회수
		boardMapper.boardCount(b_idx);
		Board vo = boardMapper.boardContent(b_idx);
		model.addAttribute("vo",vo);
		//System.out.println(vo.toString()); //=> 값이 잘 있난 확인
		return "board/boardContent";
		
	} 
	
	@GetMapping("boardForm.do")
	public String boardForm() {
		return "board/boardForm";
	}
	
	// 게시글 작성
	@PostMapping("boardInsert.do")
	public String boardInsert(Board vo, RedirectAttributes rttr) {
		boardMapper.boardInsert(vo);
		rttr.addFlashAttribute("result","ok"); //result라는 값으로 ok값이 있으면 모달을 띄운다.
		return "redirect:/boardList.do"; // 값없이 해당페이지로 보내려면 redirect로 보낸다.
   }
	
	// 게시글 수정화면 이동
	@GetMapping("boardUdateForm.do")
	public String boardUdateForm(@RequestParam("b_idx") int b_idx, Model model) {
		Board vo = boardMapper.boardContent(b_idx);
		model.addAttribute("vo", vo);
		return "board/boardUdateForm";
	}
	
	// 게시글 수정
	@PostMapping("boardUpdate.do")
	public String boardUpdate(Board vo) {
		boardMapper.boardUpdate(vo);
		return "redirect:/boardContent.do?b_idx="+vo.getB_idx();
	}
	
	// 공지사항 등록
	@GetMapping("noticeInsert.do")
	public String noticeInsert(Board vo) {
		boardMapper.noticeInsert(vo);
		
		return "redirect:/index";
		
	}
	
	// 공지사항 삭제
	@GetMapping("noticeDelete.do")
	public String noticeDelete(@RequestParam("b_idx") int b_idx) {
		boardMapper.boardDelete(b_idx);
		return "redirect:/index";
	}
		
	
}





package kr.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.board.entity.Board;

@Controller
public class PowerController {
	
	
	@GetMapping("powerMain.do")
	public String powerMain() {
		return "power/powerMain";
	}
	

}

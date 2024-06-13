package kr.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Board;
import kr.board.entity.SmpRec;
import kr.board.mapper.BoardMapper;
import kr.board.service.ApiService;
import kr.board.service.SmpService;


@Controller
public class MainController {
	
	@Autowired
	private SmpService smpService;	
	
	@Autowired
	private ApiService apiService;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/index")                  //여기 수정함
	public String index(HttpSession session,Model model) {
		
		SmpRec smpData = (SmpRec) session.getAttribute("smpData");			
				
		try {
            StringBuilder data = apiService.fetchDataFromApi();
            model.addAttribute("apiData", data);
        } catch (IOException e) {
            
        }
		
		// session.setAttribute("weather", weatherList);
		
		if (smpData == null) {			
		
		try {
			SmpRec tempSmpData = smpService.getSmpData();
			session.setAttribute("smpData", tempSmpData);
			System.out.println("호출됨");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
		
		// 공지사항 가져가기
		List<Board> list = boardMapper.noticeList();
		System.out.println("게시글의 갯수:  "+ list.size());
		model.addAttribute("notice",list);		
		
		return "index";
	}
	
	@RequestMapping("/")
	    public String intro() {
	        return "intro"; // intro.jsp로 매핑
	    }
	
	// return하는게 없으니까 얘가 비동기인지 동기인지 헷갈리므로 추천X
//	method이름이 뷰네임이랑 똑같으면 아래와 같이 가능
//	@RequestMapping("/")
//	public void index() {
//	}
	
}





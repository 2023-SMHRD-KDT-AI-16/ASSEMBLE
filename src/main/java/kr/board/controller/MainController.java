package kr.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.SmpRec;
import kr.board.entity.weatherVO;
import kr.board.service.ApiService;
import kr.board.service.SmpService;


@Controller
public class MainController {
	
	@Autowired
	private SmpService smpService;	
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping("/")
	public String index(HttpSession session) {
		
		SmpRec smpData = (SmpRec) session.getAttribute("smpData");		
		
		List<weatherVO> weatherList = apiService.fetchDataFromApi();
		
		session.setAttribute("weather", weatherList);
		
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
		
		return "index";
	}
	
	// return하는게 없으니까 얘가 비동기인지 동기인지 헷갈리므로 추천X
//	method이름이 뷰네임이랑 똑같으면 아래와 같이 가능
//	@RequestMapping("/")
//	public void index() {
//	}
	
}





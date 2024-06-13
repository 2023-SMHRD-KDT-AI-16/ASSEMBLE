package kr.board.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.entity.PredictionInfo;
import kr.board.mapper.PredictionInfoMapper;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PowerController {
	
	  @Autowired
	  private PredictionInfoMapper predictionInfoMapper;
	
	  @RequestMapping("/powerMain")
	    public String powerMain() {
	        return "/power/powerMain"; // views 폴더 아래의 power/powerMain.jsp로 매핑됨
	    }
	  
	  @RequestMapping("/getPredictionData")
	    @ResponseBody
	    public List<PredictionInfo> getPredictionData() {
	        return predictionInfoMapper.getPredictionInfo();
	    }
	  
	  
	  @RequestMapping("/getTomorrowPredictionTotal")
	    @ResponseBody
	    public double getTomorrowPredictionTotal() {
	        LocalDate tomorrow = LocalDate.now().plusDays(1);
	        List<PredictionInfo> tomorrowData = predictionInfoMapper.getPredictionInfo().stream()
	            .filter(p -> p.getPredDate().toLocalDate().equals(tomorrow))
	            .collect(Collectors.toList());

	        double totalPower = tomorrowData.stream()
	            .mapToDouble(p -> p.getPredPower().doubleValue())
	            .sum();

	        return totalPower;
	    }
	  
	  
	  
	  
}

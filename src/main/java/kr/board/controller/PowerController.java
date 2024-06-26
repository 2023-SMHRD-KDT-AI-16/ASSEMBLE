package kr.board.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.PowerInfo;
import kr.board.entity.PredictionInfo;
import kr.board.mapper.PredictionInfoMapper;

import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;
import java.math.BigDecimal;

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
	        List<PredictionInfo> data = predictionInfoMapper.getPredictionInfo();
	        return data;
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

	     // MWh를 W로 변환 (백만 단위로 나눔)
	        return totalPower / 1000000;
	    }
	  
	  @RequestMapping("/getWeeklyPredictionData")
	  @ResponseBody
	  public List<PredictionInfo> getWeeklyPredictionData() {
	      LocalDate today = LocalDate.now();
	      LocalDate startDate = today.minusDays(6); // 7일 전부터 오늘까지
	      return predictionInfoMapper.getPredictionInfo().stream()
	          .filter(p -> !p.getPredDate().toLocalDate().isBefore(startDate) && !p.getPredDate().toLocalDate().isAfter(today))
	          .collect(Collectors.toList());
	  }
	  
	  @RequestMapping("/getPastFiveYearsData")
	    @ResponseBody
	    public List<Map<String, Object>> getPastFiveYearsData() {
	        LocalDate today = LocalDate.now();
	        String monthDay = today.format(DateTimeFormatter.ofPattern("MM-dd"));
	        
	        List<PowerInfo> pastFiveYearsData = predictionInfoMapper.getPastFiveYearsData(monthDay);
	        List<Map<String, Object>> response = new ArrayList<>();

	        for (PowerInfo powerInfo : pastFiveYearsData) {
	            Map<String, Object> dataMap = new HashMap<>();
	            dataMap.put("date", powerInfo.getDate());
	            dataMap.put("pwrAmount", powerInfo.getPwrAmount());
	            response.add(dataMap);
	        }
	        return response;
	    }

	  
	  
	  
	  
}

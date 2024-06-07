package kr.board.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.core.type.TypeReference;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.board.entity.weatherVO;

import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.http.HttpStatus;

@Service
public class ApiService {
    public List<weatherVO> fetchDataFromApi() {
    	
    	// 시간대 설정 - Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
    	// API 제공 시간(~이후) : 02:10, 05:10, 08:10, 11:10, 14:10, 17:10, 20:10, 23:10

    	// 현재 시간을 가져옵니다.
        LocalDateTime now = LocalDateTime.now();
        // 제공 시간대를 설정합니다.
        String[] apiTimes = {"0230", "0530", "0830", "1130", "1430", "1730", "2030", "2330"};
        // 가장 가까운 이전 시간을 계산합니다.
        String closestTime = getClosestApiTime(now, apiTimes);
        // 해당 시간을 30분 이전으로 설정합니다.
        String adjustedTime = adjustTimeByMinutes(closestTime, -30);
    	
    	
        final String BASE_URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
        final String SERVICE_KEY = "V2jLg68b4QzcHu0yBsyBNO0Xb%2Bw0LsLWrYhYCt2tyWrC83zm7gpkN%2FAIYHMJa%2FkMQutUWfnXcO2dPLDC1dUSfg%3D%3D";
        final String BASE_DATE = "20240605";
        final String BASE_TIME = adjustedTime;
        final String NX = "55";
        final String NY = "67";

        String url = String.format("%s?serviceKey=%s&pageNo=1&numOfRows=1000&dataType=JSON&base_date=%s&base_time=%s&nx=%s&ny=%s",
                                    BASE_URL, SERVICE_KEY, BASE_DATE, BASE_TIME, NX, NY);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);

        if (response.getStatusCode() == HttpStatus.OK) {
        	
        	List<weatherVO> items=null;
        	 try {
                 ObjectMapper objectMapper = new ObjectMapper();
                 JsonNode itemsNode = objectMapper.readTree(response.getBody())
                                                  .path("response")
                                                  .path("body")
                                                  .path("items")
                                                  .path("item");
                 items = objectMapper.convertValue(itemsNode, new TypeReference<List<weatherVO>>() {});

               // 출력해보기  
               //  for (weatherVO item : items) {
               //      System.out.println("Category: " + item.getCategory());
               //      System.out.println("Forecast Date: " + item.getFcstDate());
               //      System.out.println("Forecast Time: " + item.getFcstTime());
               //      System.out.println("Forecast Value: " + item.getFcstValue());
               //  }
                 
             } catch (IOException e) {
                 e.printStackTrace();
             }
        	
        	
        	
        	return items;
            
        } else {
            return null;
        }
    }
    
    public static String getClosestApiTime(LocalDateTime now, String[] apiTimes) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
        String nowStr = now.format(formatter);

        for (String apiTime : apiTimes) {
            if (nowStr.compareTo(apiTime) < 0) {
                return getPreviousApiTime(apiTimes, apiTime);
            }
        }
        return apiTimes[apiTimes.length - 1];  // 만약 모든 제공 시간이 지나갔다면, 마지막 시간을 반환합니다.
    }

    public static String getPreviousApiTime(String[] apiTimes, String currentApiTime) {
        for (int i = 0; i < apiTimes.length; i++) {
            if (apiTimes[i].equals(currentApiTime)) {
                return i == 0 ? apiTimes[apiTimes.length - 1] : apiTimes[i - 1];
            }
        }
        return apiTimes[0];  // 기본적으로 첫 번째 시간을 반환합니다.
    }

    public static String adjustTimeByMinutes(String time, int minutes) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmm");
        LocalDateTime dateTime = LocalDateTime.now().withHour(Integer.parseInt(time.substring(0, 2)))
                                              .withMinute(Integer.parseInt(time.substring(2, 4)))
                                              .withSecond(0)
                                              .withNano(0);
        dateTime = dateTime.plusMinutes(minutes);
        return dateTime.format(formatter);
    }
}
    
    


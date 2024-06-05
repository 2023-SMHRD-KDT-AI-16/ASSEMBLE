package kr.board.service;

import java.io.IOException;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Service;

import kr.board.entity.SmpRec;

@Service
public class SmpService {
	private static String smp_url="https://www.kpx.or.kr/#section-2nd";
	
	@PostConstruct
	public SmpRec getSmpData() throws IOException {				
		
		Document document = Jsoup.connect(smp_url).get();
		
		 // class명이 smp_table인 요소 찾기
        Element smpTable = document.selectFirst(".smp_table");

        // smp_table 내부에서 data-label이 "거래일"인 요소들 찾기
        Element tradeDateElement = smpTable.select("[data-label=거래일]").first();
        Element maxElement = smpTable.select("[data-label=최고가]").first();
        Element minElement = smpTable.select("[data-label=최소가]").first();
        Element meanElement = smpTable.select("[data-label=평균가]").first();
		
        String tradeDate = tradeDateElement != null ? tradeDateElement.text() : "No data";
        String maxPrice = maxElement != null ? maxElement.text() : "No data";
        String minPrice = minElement != null ? minElement.text() : "No data";
        String meanPrice = meanElement != null ? meanElement.text() : "No data";
		
        Element recTable = document.selectFirst(".rec_table");
        
        Element recDayElement = recTable.select("[data-label=거래일]").first();
        Element recMountElement = recTable.select("[data-label=거래량]").first();
        Element recMeanElement = recTable.select("[data-label=평균가]").first();
        Element recMaxElement = recTable.select("[data-label=최고가]").first();
        Element recMinElement = recTable.select("[data-label=최저가]").first();
        Element recCloseElement = recTable.select("[data-label=종가]").first();
        
        String rectradeDate = recDayElement != null ? tradeDateElement.text() : "No data";
        String recMountPrice = recMountElement != null ? maxElement.text() : "No data";
        String recMeanPrice = recMeanElement != null ? minElement.text() : "No data";
        String recMaxPrice = recMaxElement != null ? meanElement.text() : "No data";
        String recMinPrice = recMinElement != null ? meanElement.text() : "No data";
        String recClosePrice = recCloseElement != null ? meanElement.text() : "No data";
        
		SmpRec smp = new SmpRec(tradeDate,maxPrice,minPrice,meanPrice,rectradeDate,recMountPrice,recMeanPrice,
				recMaxPrice,recMinPrice,recClosePrice);

		
		return smp;
		
	}
		
	
}

package kr.board.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import kr.board.entity.News;
import org.springframework.stereotype.Service;

@Service
public class NewsService {
    private static String newsUrl = "https://search.daum.net/search?w=news&nil_search=btn&DA=STC&enc=utf8&cluster=y&cluster_page=1&q=%ED%83%9C%EC%96%91%EA%B4%91&p=1&sort=accuracy";

    public List<News> getLatestNews() {
        List<News> articles = new ArrayList<>();
        try {
            Document doc = Jsoup.connect(newsUrl).get();
            for (int i = 1; i <= 5; i++) {
                Elements article = doc.select("ul > li:nth-child(" + i + ")");
                String title = article.select("div.item-title > strong > a").text();
                String link = article.select("div.item-contents > p > a").attr("href");
                String summary = article.select("div.item-contents > p > a").text();
                
                
                
                
                String thumbnailUrl = article.select("#news_img_" + (i - 1) + " > a > img").attr("src");
                if (thumbnailUrl.isEmpty() || thumbnailUrl.contains("data:image/gif")) {
                    thumbnailUrl = article.select("#news_img_" + (i - 1) + " > a > img").attr("data-src");
                }
                if (thumbnailUrl.isEmpty() || thumbnailUrl.contains("data:image/gif")) {
                    thumbnailUrl = article.select("#news_img_" + (i - 1) + " > a > img").attr("data-original");
                }

                // 상대 경로를 절대 경로로 변환
                if (!thumbnailUrl.startsWith("http") && !thumbnailUrl.isEmpty()) {
                    thumbnailUrl = "https://search4.kakaocdn.net/argon/200x200_85_c/" + thumbnailUrl;
                }
                articles.add(new News(title, link, summary, thumbnailUrl));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return articles;
    }
}
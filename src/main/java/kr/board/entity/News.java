package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor
@Data
@ToString
public class News {

    private String title;
    private String link;
    private String summary;
    private String thumbnailUrl;
    private String w_date;
    
}


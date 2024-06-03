package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Board {

	private int b_idx; // 번호
	private String b_category; // 공지사항 / 게시글
	private String b_title; // 제목
	private String b_content; // 내용
	private String b_file; // 첨부파일
	private String created_at; // 작성일
	private String user_nick; // 작성자
	private int b_views; // 조회수
	
	
}






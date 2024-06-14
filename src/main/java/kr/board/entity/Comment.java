package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Comment {
	
	private int cmt_idx;
	private int b_idx;
	private String cmt_content;
	private String created_at;
	private String user_id;
	
}

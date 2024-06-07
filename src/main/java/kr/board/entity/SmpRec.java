package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor
@Data
@ToString
public class SmpRec {
	private String smpDay;
	private String maxSmp;
	private String minSmp;
	private String meanSmp;
	private String recDay;
	private String totRecValue;
	private String landAvgPrc;
	private String landHgPrc;
	private String landLwPrc;
	private String clsPrc;
}

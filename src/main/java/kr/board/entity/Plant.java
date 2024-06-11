package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor
@Data
@ToString
public class Plant {
	
	private int plant_idx;
	private String plant_name;
	private String plant_addr;
	private String plant_addr_add;
	private String plant_tel;
	private String plant_are;
	private String region;
	private Double plant_volume;
	
	
	
}

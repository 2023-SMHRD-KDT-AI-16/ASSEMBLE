package kr.board.entity;
import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor
@Data
@ToString

public class PowerInfo {
	private int pwrIdx;
    private String date;
    private int time;
    private double pwrAmount;
    private int plantIdx;
    private String pwrMemo;

}

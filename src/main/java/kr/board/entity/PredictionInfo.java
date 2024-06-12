package kr.board.entity;
import java.math.BigDecimal;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@NoArgsConstructor 
@AllArgsConstructor
@Data
@ToString

public class PredictionInfo {
	private int predIdx;
    private int plantIdx;
    private Date predDate;
    private int predTime;
    private BigDecimal predPower;
    private String predResult;
}

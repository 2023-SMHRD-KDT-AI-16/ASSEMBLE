package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import java.math.BigDecimal;
import java.sql.Date;

@NoArgsConstructor 
@AllArgsConstructor
@Data
@ToString
public class solar_env_info {

	
	 	private int envIdx;
	    private Date date;
	    private int time;
	    private BigDecimal temp;
	    private BigDecimal humidity;
	    private BigDecimal pressure;
	    private BigDecimal sunshineHours;
	    private BigDecimal cloudCoverage;
	    private BigDecimal lowMidCloudCoverage;
	    private BigDecimal seaTemp;
	    private BigDecimal so2;
	    private BigDecimal co;
	    private BigDecimal o3;
	    private BigDecimal no2;
	    private BigDecimal pm10;
	    private BigDecimal pm25;
	    private int plantIdx;
	    
	    
}

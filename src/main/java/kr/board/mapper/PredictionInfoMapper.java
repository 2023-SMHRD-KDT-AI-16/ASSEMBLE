package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.board.entity.PowerInfo;
import kr.board.entity.PredictionInfo;

@Mapper
public interface PredictionInfoMapper {

	List<PredictionInfo> getPredictionInfo();
	List<PowerInfo> getPastFiveYearsData(@Param("monthDay") String monthDay);
}

package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

@Mapper
public interface BoardMapper {

	public List<Board> boardList();

	public void boardInsert(Board board);

	public Board boardContent(int b_idx);

	public void boardDelete(int b_idx);

	public void boardUpdate(Board vo);
	
	public void boardCount(int b_idx);

	public List<Board> noticeList();

	public void noticeInsert(Board vo);

}




















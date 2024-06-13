package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.Plant;
import kr.board.entity.User;

@Mapper
public interface UserMapper {

	//public User registerCheck(String memID);

	public int join(User m);

	public User login(User m);

	public int update(User m);

	public User getMember(String user_id);

	public void profileUpdate(User vo);

	public User idCheck(String user_id);

	public User nickCheck(String user_nick);

	public User checkEmail(String email);

	public int pwChange(User vo);

	public int plantInsert(Plant p);

	public void plantUpdateUser(User m);

	public Plant getPlant(int plant_idx);

	public int plantUpdate(Plant p);

	public void goProDel(String user_id);


}




















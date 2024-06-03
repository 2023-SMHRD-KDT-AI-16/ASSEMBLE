package kr.board.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor // form에서 name값으로 요청데이터 넘길 때 알아서 객체로 묶어주는데 기본생성자가 꼭 있어야함
@AllArgsConstructor
@Data
@ToString
public class User {
	
	// 회원 아이디 
    private String user_id;

    // 회원 비밀번호 
    private String user_pw;

    // 회원 닉네임 
    private String user_nick;

    // 회원 이메일 
    private String user_email;

    // 회원 전화번호 
    private String user_phone;

    // 회원 가입일자 
    private String joined_at;

    // 회원 유형 
    private String user_type;

    // 발전소 식별자 
    private int plant_idx;
    
    // 회원 상태
    private String user_state;
    //회원 탈퇴일자
    private String user_leave_at;
	
}










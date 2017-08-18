package kr.kosa.destiny.users.dao;

import kr.kosa.destiny.users.model.UserVO;

public interface IUserRepository {
	
	//회원가입
	void signUp(UserVO user);
	
	//회원탈퇴
	void withDraw(String userId, String userPw);
	
	//로그인
	String getPassword(String userId);
	
	//ID추출
	UserVO selectUserByUserId(String userId);
	
	//정보 수정
	void updateInfo(UserVO user);
}

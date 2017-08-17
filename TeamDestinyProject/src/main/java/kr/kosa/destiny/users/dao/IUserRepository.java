package kr.kosa.destiny.users.dao;

import kr.kosa.destiny.users.model.UserVO;

public interface IUserRepository {
	
	//회원가입
	void signUp(UserVO user);
	
	//로그인
	String getPassword(String userEmail);
	
	//ID추출
	UserVO selectUserByUserEmail(String userEmail);
	
	//정보 수정
	void updateInfo(UserVO user);
}

package kr.kosa.destiny.users.service;

import kr.kosa.destiny.users.model.UserVO;

public interface IUserService {

	//회원가입
	void signUp(UserVO user);
	
	//로그인
	boolean checkPassword(String userEmail, String userPw);
	
	//ID추출
	UserVO selectUserByUserEmail(String userEmail);
	
	//정보 수정
	void updateInfo(UserVO user);
}

package kr.kosa.destiny.users.service;

import kr.kosa.destiny.users.model.UserVO;

public interface IUserService {

	//회원가입
	void signUp(UserVO user);
	
	//회원탈퇴
	void withDraw(String userId, String userPw);
	
	//로그인
	boolean checkPassword(String userId, String userPw);
	
	//ID추출
	UserVO selectUserByUserId(String userId);
	
	//정보 수정
	void updateInfo(UserVO user);
}

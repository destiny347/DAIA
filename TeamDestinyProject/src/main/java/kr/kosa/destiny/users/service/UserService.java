package kr.kosa.destiny.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import kr.kosa.destiny.users.dao.IUserRepository;
import kr.kosa.destiny.users.model.UserVO;

@Service
public class UserService implements IUserService {
	
	@Autowired
	IUserRepository userRepository;
	
	@Override
	public void signUp(UserVO user) {
		userRepository.signUp(user);
	}
	
	@Override
	public void updateInfo(UserVO user) {
		userRepository.updateInfo(user);
	}

	@Override
	public boolean checkPassword(String userId, String userPw) {
		String pw = userRepository.getPassword(userId);
		if(pw!=null && pw.equals(userPw)) {
			return true;
		} else {
			return false;
		}
	}	

	@Override
	public UserVO selectUserByUserId(String userId) {
		return userRepository.selectUserByUserId(userId);
	}

	@Override
	public void withDraw(String userId, String userPw) {
		userRepository.withDraw(userId, userPw);
	}
	
	

}

package kr.kosa.destiny.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public boolean checkPassword(String userEmail, String userPw) {
		String pw = userRepository.getPassword(userEmail);
		if(pw!=null && pw.equals(userPw)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public UserVO selectUserByUserEmail(String userEmail) {
		return userRepository.selectUserByUserEmail(userEmail);
	}

}

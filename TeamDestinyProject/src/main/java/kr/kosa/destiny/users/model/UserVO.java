package kr.kosa.destiny.users.model;


public class UserVO {

	private String userEmail;
	private String userPw;
	private String userPwCheck;
	private String userName;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserPwCheck() {
		return userPwCheck;
	}
	public void setUserPwCheck(String userPwCheck) {
		this.userPwCheck = userPwCheck;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		return "UserVO [userEmail=" + userEmail + ", userPw=" + userPw + ", userPwCheck=" + userPwCheck + ", userName="
				+ userName + "]";
	}
	
}

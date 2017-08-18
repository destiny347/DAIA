package kr.kosa.destiny.users.model;


public class UserVO {
	
	private String userId;
	private String userPw;
	private String userPwCheck;
	private String userName;
	private String userEmail;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userPwCheck=" + userPwCheck + ", userName="
				+ userName + ", userEmail=" + userEmail + "]";
	}
	
}

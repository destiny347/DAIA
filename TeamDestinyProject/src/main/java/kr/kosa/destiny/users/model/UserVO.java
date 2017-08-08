package kr.kosa.destiny.users.model;


public class UserVO {

	private String userEmail;
	private String userPw;
	private String userName;
	private String userPhone;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	@Override
	public String toString() {
		return "UserVO [userEmail=" + userEmail + ", userPw=" + userPw + ", userName=" + userName + ", userPhone="
				+ userPhone + "]";
	}
	
}

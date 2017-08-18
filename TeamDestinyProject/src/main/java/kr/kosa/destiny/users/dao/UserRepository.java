package kr.kosa.destiny.users.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.kosa.destiny.users.model.UserVO;

@Repository
public class UserRepository implements IUserRepository {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public class UserMapper implements RowMapper<UserVO> {

		@Override
		public UserVO mapRow(ResultSet rs, int count) throws SQLException {
			UserVO user = new UserVO();
			user.setUserId(rs.getString("user_id"));
			user.setUserPw(rs.getString("user_pw"));
			user.setUserPwCheck(rs.getString("user_pw_check"));
			user.setUserName(rs.getString("user_name"));
			user.setUserEmail(rs.getString("user_email"));
			return user;
		}
	}
	
	@Override
	public void signUp(UserVO user) {
		String sql = "insert into users values(?,?,?,?,?)";
		jdbcTemplate.update(sql, 
				user.getUserId(),
				user.getUserPw(),
				user.getUserPwCheck(),
				user.getUserName(),
				user.getUserEmail()
				);
	}
	
	@Override
	public void updateInfo(UserVO user) {
		String sql = "update users set user_pw=?, user_pw_check=?, user_name=?, user_email=? where user_id=?";
		jdbcTemplate.update(sql,				
				user.getUserPw(),
				user.getUserPwCheck(),
				user.getUserName(),
				user.getUserEmail(),
				user.getUserId()
				);
	}
	
	@Override
	public void withDraw(String userId, String userPw) {
		String sql = "delete from users where (user_id=? and user_pw=?)";
		jdbcTemplate.update(sql, userId, userPw);
	}

	@Override
	public String getPassword(String userId) {
		String sql = "select user_pw from users where user_id=?";
		return jdbcTemplate.queryForObject(sql, String.class, userId);
	}

	@Override
	public UserVO selectUserByUserId(String userId) {
		String sql = "select * from users where user_id=?";
		return jdbcTemplate.queryForObject(sql, new UserMapper(),userId);
	
	}

}

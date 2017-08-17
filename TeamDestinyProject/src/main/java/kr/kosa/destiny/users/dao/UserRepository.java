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
			user.setUserEmail(rs.getString("user_email"));
			user.setUserPw(rs.getString("user_pw"));
			user.setUserPwCheck(rs.getString("user_pw_check"));
			user.setUserName(rs.getString("user_name"));
			return user;
		}
	}
	
	@Override
	public void signUp(UserVO user) {
		String sql = "insert into users values(?,?,?,?)";
		jdbcTemplate.update(sql, 
				user.getUserEmail(),
				user.getUserPw(),
				user.getUserPwCheck(),
				user.getUserName()
				);
	}
	
	@Override
	public void updateInfo(UserVO user) {
		String sql = "update users set user_email=?, user_pw=?, user_name=? where user_email=?";
		jdbcTemplate.update(sql, 
				user.getUserEmail(),
				user.getUserPw(),
				user.getUserName(),
				user.getUserEmail()
				);
	}

	@Override
	public String getPassword(String userEmail) {
		String sql = "select user_pw from users where user_email=?";
		return jdbcTemplate.queryForObject(sql, String.class, userEmail);
	}

	@Override
	public UserVO selectUserByUserEmail(String userEmail) {
		String sql = "select * from users where user_email=?";
		return jdbcTemplate.queryForObject(sql, new UserMapper(),userEmail);
	
	}

}

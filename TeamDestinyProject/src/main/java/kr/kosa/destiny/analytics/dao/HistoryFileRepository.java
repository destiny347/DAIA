package kr.kosa.destiny.analytics.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.kosa.destiny.analytics.model.HistoryFileVO;


@Repository
public class HistoryFileRepository implements IHistoryFileRepository {

	@Autowired
	JdbcTemplate jdbcTemplate;
		
	@Override
	public void uploadFile(HistoryFileVO file) {
		// TODO Auto-generated method stub
		String sql = "insert into file_his (user_id, file_name,file_date,file_data,flow_num) "
				+ "values(?,?,sysdate,?,?)";
		jdbcTemplate.update(sql,file.getUserId(),
				file.getFileName(),
				file.getFileDate(),
				file.getFileData(),
				file.getFlowNum());
	}


	@Override
	public List<HistoryFileVO> getAllFileList() {
		// TODO Auto-generated method stub
		String sql = "select "
				+ "user_id, file_name, file_date,flow_num "
				+ "from file_his "
				+ "order by flow_num desc";
		return jdbcTemplate.query(sql, new RowMapper<HistoryFileVO>(){
			@Override
			public HistoryFileVO mapRow(ResultSet rs, int count) throws SQLException {
				HistoryFileVO file = new HistoryFileVO();
				file.setUserId(rs.getString("userId"));
				file.setFileName(rs.getString("fileName"));
				file.setFileDate(rs.getTimestamp("fileDate"));
				file.setFlowNum(rs.getInt("flowNum"));
				return file;
			}
		});
	}

	@Override
	public HistoryFileVO getFile(int flowNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateDirectory(HashMap<String, Object> map) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFile(int fileId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateFile(HistoryFileVO file) {
		// TODO Auto-generated method stub

	}

}

package kr.kosa.destiny.analytics.dao;


import java.util.HashMap;
import java.util.List;

import kr.kosa.destiny.analytics.model.HistoryFileVO;

public interface IHistoryFileRepository {
	
	void uploadFile(HistoryFileVO file);

	List<HistoryFileVO> getAllFileList();

	HistoryFileVO getFile(int flowNum);

	void updateDirectory(HashMap<String, Object> map);

	void deleteFile(int fileId);
	void updateFile(HistoryFileVO file);

}
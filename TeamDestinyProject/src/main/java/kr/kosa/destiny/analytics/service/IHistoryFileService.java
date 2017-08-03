package kr.kosa.destiny.analytics.service;

import java.io.IOException;
import java.util.List;

import kr.kosa.destiny.analytics.model.HistoryFileVO;

public interface IHistoryFileService {
	
	void uploadFile(String fileName) throws IOException;

	List<HistoryFileVO> getAllFileList();

	
}

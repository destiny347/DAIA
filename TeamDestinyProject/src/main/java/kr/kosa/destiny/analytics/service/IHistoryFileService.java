package kr.kosa.destiny.analytics.service;

import java.util.List;

import kr.kosa.destiny.analytics.model.HistoryFileVO;

public interface IHistoryFileService {
	
	void uploadFile(HistoryFileVO file);

	List<HistoryFileVO> getAllFileList();
}

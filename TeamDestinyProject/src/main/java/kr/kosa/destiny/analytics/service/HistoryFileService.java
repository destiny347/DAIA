package kr.kosa.destiny.analytics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosa.destiny.analytics.dao.IHistoryFileRepository;
import kr.kosa.destiny.analytics.model.HistoryFileVO;

@Service
public class HistoryFileService implements IHistoryFileService {

	@Autowired
	IHistoryFileRepository historyFileRepository;
	
	@Override
	public void uploadFile(HistoryFileVO file) {
		// TODO Auto-generated method stub
		historyFileRepository.uploadFile(file);
	}

	@Override
	public List<HistoryFileVO> getAllFileList() {
		// TODO Auto-generated method stub
		return historyFileRepository.getAllFileList();
	}

}

package kr.kosa.destiny.analytics.service;

import java.util.List;
import java.io.*;
import java.net.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosa.destiny.analytics.dao.IHistoryFileRepository;
import kr.kosa.destiny.analytics.model.HistoryFileVO;

@Service
public class HistoryFileService implements IHistoryFileService {

	@Autowired
	IHistoryFileRepository historyFileRepository;
	 
	    /**
	     * # URL 경로의 파일 다운로드
	     * @throws IOException 
	     */

	public void uploadFile(String fileName) throws IOException {
		// TODO Auto-generated method stub
		float[][] indat = new float[2880][6];
		ResultSet rs = null;
	    PreparedStatement pstmt = null;
		HistoryFileVO file = new HistoryFileVO();
		file.setFlowNum(1);
		file.setFileName(fileName);
		file.setUserId("me");;
		String createfile="C:\\Users\\COM\\Desktop\\"+fileName;
		FileWriter fw = new FileWriter(createfile);
		byte[] Str2 = fw.getEncoding().getBytes();
		file.setFileData(Str2);
		
		historyFileRepository.uploadFile(file);       

	}

	@Override
	public List<HistoryFileVO> getAllFileList() {
		// TODO Auto-generated method stub
		return historyFileRepository.getAllFileList();
	}



}

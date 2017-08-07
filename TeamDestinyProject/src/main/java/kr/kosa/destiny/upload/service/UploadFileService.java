package kr.kosa.destiny.upload.service;

import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosa.destiny.upload.dao.IUploadFileRepository;
import kr.kosa.destiny.upload.model.UploadFileVO;

@Service
public class UploadFileService implements IUploadFileService {

	@Autowired
	IUploadFileRepository uploadFileRepository;
	
	@Override
	public void insertFile(UploadFileVO file){
		// controller에서 name과 num을 가지고 온다.
		// 해야할일 directory name과 filesize, contenttype, filedata를 넣어주기
		file.setFileId(uploadFileRepository.getMaxFileId()+1);
		uploadFileRepository.insertFile(file);
	}
	
	@Override
	public void uploadFile(UploadFileVO file) {
		file.setFileId(uploadFileRepository.getMaxFileId()+1);
		uploadFileRepository.uploadFile(file);
	}

	@Override
	public List<UploadFileVO> getFileList(String dir) {
		return uploadFileRepository.getFileList(dir);
	}

	@Override
	public List<UploadFileVO> getImageList(String dir) {
		return uploadFileRepository.getImageList(dir);
	}
	
	@Override
	public List<UploadFileVO> getAllFileList(UploadFileVO file) {
		return uploadFileRepository.getAllFileList(file);
	}
	
	@Override
	public UploadFileVO getFile(int fileId) {
		return uploadFileRepository.getFile(fileId);
	}

	@Override
	public void deleteFile(int fileId) {
		uploadFileRepository.deleteFile(fileId);
	}

	@Override
	public String getDirectoryName(int fileId) {
		return uploadFileRepository.getDirectoryName(fileId);
	}

	@Override
	public void updateDirectory(int[] fileIds, String directoryName) {
		for(int fileId : fileIds) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fileId", fileId);
			map.put("directoryName", directoryName);
			uploadFileRepository.updateDirectory(map);
		}
	}

	@Override
	public void updateFile(UploadFileVO file) {
		uploadFileRepository.updateFile(file);
	}

}

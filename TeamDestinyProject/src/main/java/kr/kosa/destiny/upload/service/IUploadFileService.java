package kr.kosa.destiny.upload.service;

import java.util.List;

import kr.kosa.destiny.upload.model.UploadFileVO;

public interface IUploadFileService {

	void uploadFile(UploadFileVO file);
	List<UploadFileVO> getAllFileList();
	UploadFileVO getFile(int fileId);
	void deleteFile(int fileId);	
	
}

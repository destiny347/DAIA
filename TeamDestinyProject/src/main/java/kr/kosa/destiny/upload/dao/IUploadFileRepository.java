package kr.kosa.destiny.upload.dao;

import java.util.List;

import kr.kosa.destiny.upload.model.UploadFileVO;

public interface IUploadFileRepository {
	
	int getMaxFileId();
	void uploadFile(UploadFileVO file);
	List<UploadFileVO> getAllFileList();
	UploadFileVO getFile(int fileId);
	void deleteFile(int fileId);
}


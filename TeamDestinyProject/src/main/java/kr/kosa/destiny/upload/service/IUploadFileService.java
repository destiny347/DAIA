package kr.kosa.destiny.upload.service;

import java.util.List;

import kr.kosa.destiny.upload.model.UploadFileVO;

public interface IUploadFileService {

	void uploadFile(UploadFileVO file);

	List<UploadFileVO> getFileList(String dir);
	List<UploadFileVO> getAllFileList(UploadFileVO file);
	List<UploadFileVO> getImageList(String dir);

	UploadFileVO getFile(int fileId);
	UploadFileVO getNameFile(String fileName);
	
	String getDirectoryName(int fileId);
	void updateDirectory(int[] fileIds, String directoryName);

	void deleteFile(int fileId);
	void updateFile(UploadFileVO file);
	
	void insertFile(UploadFileVO file);
		
	
}

package kr.kosa.destiny.analytics.model;

import java.sql.Timestamp;

public class HistoryFileVO {
	private String userId;
	private String fileName;
	private Timestamp fileDate;
	private byte[] fileData;
	private int flowNum;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Timestamp getFileDate() {
		return fileDate;
	}
	public void setFileDate(Timestamp fileDate) {
		this.fileDate = fileDate;
	}
	public byte[] getFileData() {
		return fileData;
	}
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}
	public int getFlowNum() {
		return flowNum;
	}
	public void setFlowNum(int flowNum) {
		this.flowNum = flowNum;
	}
	
	

}


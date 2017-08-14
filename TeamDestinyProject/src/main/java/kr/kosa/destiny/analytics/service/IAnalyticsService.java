package kr.kosa.destiny.analytics.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.kosa.destiny.analytics.model.IrisVO;
import kr.kosa.destiny.analytics.model.SampleVO;
import kr.kosa.destiny.analytics.model.SampleVO1;
import kr.kosa.destiny.analytics.model.SummaryVO;

public interface IAnalyticsService {
/*	ArrayList<IrisVO> getAvgPetalBySpecies();
	ArrayList<SampleVO> getAvgPetalBySpecies2();
	ArrayList<SampleVO1> getAvgPetalBySpecies3();*/
	ArrayList<SampleVO> analyticsDatabase(int fileId);
	Map<String, Object> analyticsDatabaseInfo(int fileId);
	Map<String, Object> analyticsDatabaseInfo(String fileName);
	Map<String, Object> getSummary(int fileId);
	SummaryVO getSummaryList(int fileId);

	//데이터 전처리 부분
	
	Map<String, Object> ynTo10(String[] column);
	Map<String, Object> naTo6(String[] column);
	Map<String, Object> nullToN(String[] column);
	Map<String, Object> naToNumber(String[] column, int number);
	Map<String, Object> stringToNumber(String column);
	Map<String, Object> getFirstChrToNum(String column);
	
	Map<String, Object> zeroToMeanByGroup(String groupcol, String datacol);
	Map<String, Object> colToMeanByGroup(String groupcol, String datacol);
	void getRestructuredData(String ...args);
	void getMergedTable(int fileId1, int fileId2);
	List<Map<String, Object>> dataSampling(double trainrate, String column);
	void xgboost(String independentvar, String primecol);
	void nnet(String independentvar, String primekey);
	void e1071(String independentvar, String primekey);


	// 민구 테스트
	ArrayList<SampleVO> getCsvFile();
	ArrayList<SampleVO> getMarriedSiu();


}

package kr.kosa.destiny.analytics.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.kosa.destiny.analytics.model.Graph2DVO;
import kr.kosa.destiny.analytics.model.Graph3DVO;

public interface IAnalyticsService {
	
	//데이터 선택 부분
	Map<String, Object> analyticsDatabaseInfo(int fileId);
	Map<String, Object> getSummary(int fileId);

	//데이터 전처리 부분	
	List<Map<String, String[]>> ynTo10(String[] column);
	List<Map<String, String[]>> nullToN(String[] column);
	List<Map<String, String[]>> naTo6(String[] chkValue);
	List<Map<String, String[]>> naToNumber(String[] column, int number);	

	Map<String, Integer> min(String[] chkValue);
	Map<String, Integer> max(String[] chkValue);
	Map<String, Object> colToMeanByGroup(String groupcol, String datacol);
			
	//데이터 재구조화 부분
	void getRestructuredData(String[] column);
	void getMergedTable(int fileId1, int fileId2);
	
	//데이터 시각화 부분
	ArrayList<Graph2DVO> getCsvFile();
	ArrayList<Graph2DVO> getMarriedSiu();
	ArrayList<Graph3DVO> getBlackML();
	
	//머신러닝 부분
	List<Map<String, Object>> dataSampling(double trainrate, String column);
	void xgboost(String independentvar, String primecol);
	void nnet(String independentvar, String primekey);
	void e1071(String independentvar, String primekey);
}

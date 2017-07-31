package kr.kosa.destiny.analytics.service;

import java.util.ArrayList;
import java.util.Map;

import kr.kosa.destiny.analytics.model.IrisVO;
import kr.kosa.destiny.analytics.model.SampleVO;
import kr.kosa.destiny.analytics.model.SummaryVO;

public interface IAnalyticsService {
	ArrayList<IrisVO> getAvgPetalBySpecies();
	ArrayList<SampleVO> getAvgPetalBySpecies2();
	ArrayList<SampleVO> analyticsDatabase(int fileId);
	Map<String, Object> analyticsDatabaseInfo(int fileId);
	Map<String, Object> getSummary(int fileId);
	SummaryVO getSummaryList(int fileId);
}

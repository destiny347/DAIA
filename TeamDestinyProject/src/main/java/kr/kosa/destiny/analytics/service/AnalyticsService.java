package kr.kosa.destiny.analytics.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.rosuda.JRI.REXP;
import org.rosuda.JRI.RList;
import org.rosuda.JRI.Rengine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosa.destiny.analytics.model.IrisVO;
import kr.kosa.destiny.analytics.model.SampleVO;
import kr.kosa.destiny.analytics.model.SampleVO1;
import kr.kosa.destiny.analytics.model.SummaryVO;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;

@Service
public class AnalyticsService implements IAnalyticsService {

	private static final Logger logger = LoggerFactory.getLogger(AnalyticsService.class);

	@Autowired
	Rengine rEngine;

	@Autowired
	IUploadFileService fileService;

	@Override
	public ArrayList<IrisVO> getAvgPetalBySpecies() {
		ArrayList<IrisVO> irisList = new ArrayList<IrisVO>();
		try {
			String[] species = {"setosa", "versicolor", "virginica"};
			REXP result = rEngine.eval("tapply(iris$Petal.Length, iris$Species, mean)");
			REXP result2 = rEngine.eval("tapply(iris$Petal.Width, iris$Species, mean)");

			double resultList[] = result.asDoubleArray();
			double resultList2[] = result2.asDoubleArray();
			for(int i=0; i<resultList.length; i++) {
				IrisVO iris = new IrisVO();
				iris.setSpecies(species[i]);
				iris.setPetalLength(resultList[i]);
				iris.setPetalWidth(resultList2[i]);
				irisList.add(iris);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return irisList;

	}

	@Override
	public ArrayList<SampleVO> getAvgPetalBySpecies2() {
		ArrayList<SampleVO> irisList = new ArrayList<SampleVO>();
		try {
			//            String[] species = {"setosa", "versicolor", "virginica"};
			REXP result = rEngine.eval("tapply(iris$Petal.Length, iris$Species, mean)");
			REXP result2 = rEngine.eval("tapply(iris$Petal.Width, iris$Species, mean)");

			SampleVO sample1 = new SampleVO();
			sample1.setName("P.L mean");
			sample1.setType("column");
			sample1.setData(result.asDoubleArray());
			irisList.add(sample1);
			SampleVO sample2 = new SampleVO();
			sample2.setName("P.W mean");
			sample2.setType("column");
			sample2.setData(result2.asDoubleArray());
			irisList.add(sample2);
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return irisList;
	}
	
	@Override
	public ArrayList<SampleVO1> getAvgPetalBySpecies3() {
		ArrayList<SampleVO1> irisList = new ArrayList<SampleVO1>();
		try {
			REXP result = rEngine.eval("(ming <- tapply(iris$Petal.Length, iris$Species, mean))");
			REXP result1 = rEngine.eval("names(ming)");
			
			SampleVO1 sample1 = new SampleVO1();
			sample1.setName(result1.asStringArray());
			sample1.setY(result.asDoubleArray());
			irisList.add(sample1);

		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return irisList;
	}

	@Override
	public ArrayList<SampleVO> analyticsDatabase(int fileId) {
		ArrayList<SampleVO> irisList = new ArrayList<SampleVO>();
		UploadFileVO file = fileService.getFile(fileId);
		byte[] data = file.getFileData();
		try {
			long exp = rEngine.rniPutString(new String(data));
			rEngine.rniAssign("data", exp, 0);

			REXP rdata = rEngine.eval("(data <- read.table(text = data, sep =\",\", header = TRUE, stringsAsFactors = FALSE))");
			logger.info(rdata.toString());
			//			
			//			RList rdataList = rdata.asList();
			//			String[] keys = rdataList.keys();
			//			Object[] modelData = new Object[keys.length];
			//			for(String key : keys) {
			//				System.out.println(key);
			//			}
			//			System.out.println("----");
			//			System.out.println(rdataList.toString());
			//			System.out.println("=====");
			//			for(int i=0; i<keys.length; i++) {
			//				switch(rdataList.at(i).rtype) {
			//				case 14:
			//					modelData[i] = rdataList.at(i).asDoubleArray();
			//					for(double col : rdataList.at(i).asDoubleArray()) {
			//						System.out.print(col + "\t");
			//					}
			//					break;
			//				case 16:
			//					modelData[i] = rdataList.at(i).asStringArray();
			//					for(String col : rdataList.at(i).asStringArray()) {
			//						System.out.print(col + "\t");
			//					}
			//				}
			//				System.out.println();
			//			}
			//			System.out.println("=====");
			//			System.out.println();
			//			double[] col1 = rdataList.at(1).asDoubleArray();
			//			for(double col : col1) {
			//				System.out.print(col + "\t");
			//			}
			//			System.out.println();
			//			
			//			REXP names = rEngine.eval("names(data)");
			//			for(String colName : names.asStringArray()) {
			//				System.out.println(colName);
			//			}
			REXP result = rEngine.eval("tapply(data$Petal.Length, data$Species, mean)");
			REXP result2 = rEngine.eval("tapply(data$Petal.Width, data$Species, mean)");

			SampleVO sample1 = new SampleVO();
			sample1.setName("꽃잎 길이 평균");
			sample1.setType("column");
			sample1.setData(result.asDoubleArray());
			irisList.add(sample1);
			SampleVO sample2 = new SampleVO();
			sample2.setName("꽃잎 너비 평균");
			sample2.setType("column");
			sample2.setData(result2.asDoubleArray());
			irisList.add(sample2);
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return irisList;
	}


	@Override
	public Map<String, Object> analyticsDatabaseInfo(int fileId) {
		//rData안에 객체를 매핑시킬때 String, Object 타입으로 put해줘야 한다는 것을 의미.
		Map<String, Object> rData = new Hashtable<String, Object>();

		UploadFileVO file = fileService.getFile(fileId);
		byte[] data = file.getFileData();
		//		logger.info(new String(data));
		try {
			//DB에 저장된 파일형식을 R이 읽을 수 있도록 변환하는 변수 -> exp
			long exp = rEngine.rniPutString(new String(data, "UTF-8"));
			//R에서 "data"라는 변수를 사용하기 위해 exp를 전역변수형태로 전달하는 메서드(0을 사용하면 전역변수로 지정가능)
			rEngine.rniAssign("data", exp, 0);

			//eval은 R에게 스크립트를 실행하라고 전달하는 메서드. setlocale은 언어를 설정해주는 것.
			rEngine.eval("Sys.setlocale(category=\"LC_ALL\", locale=\"English_United States.1252\")");

			//R스크립트를 변수로 선언하려면 데이터타입을 REXP로 해야한다. 스크립트 안의 내용은 R의 data변수를 읽어서 dataFrame이라는 변수로 지정한 후 JAVA의 rdataFrame 변수로 선언. ()를 통해 실행까지 시킴
			REXP rdataFrame = rEngine.eval("(dataFrame <- read.table(text=data, sep=\",\", fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding=\"UTF-8\", fileEncoding=\"UTF-8\"))");

			//R에서 규정한 data를 list형식으로 바꿔주고 JAVA에서 RList로 사용하겠다.
			RList rdataList = rdataFrame.asList();
			//			System.out.println(rdataList.toString());

			//R데이터의 리스트의 key를 String배열타입의 keys객체에 저장. keys는 열의 개수(40)
			String[] keys = rdataList.keys();

			//rData 변수에 String, Object 타입으로 put.
			rData.put("colNames", keys);

			//Object[]로 만들어야 여러 데이터 타입들을 가져올 수 있다.
			Object[] modelData = new Object[keys.length];
			//열 이름들을 출력하기 위해 향상된 for 반복문으로 keys의 길이만큼 key값을 반복시킨다.
			//			for(String key : keys) {
			//				System.out.print(key + "\t");
			//			}
			//			System.out.println();	
			//			System.out.print(keys.length);

			//행 정보들을 출력하기 위해 반복문을 사용.
			for(int i=0; i<keys.length; i++) {

				//행 정보의 데이터 타입에 따라 정보를 가져오기 위한 조건문.
				switch(rdataList.at(i).rtype) {
				//rtype 은 https://github.com/s-u/rJava/blob/master/jri/REXP.java 참고
				case REXP.LGLSXP: //logical vectors, 10
					modelData[i] = rdataList.at(i).asBool();
					break;
				case REXP.INTSXP: //integer vectors, 13
					modelData[i] = rdataList.at(i).asIntArray();
					break;
				case REXP.REALSXP: //real variables, 14
					modelData[i] = rdataList.at(i).asDoubleArray();
					break;
				case REXP.STRSXP: //string vectors, 16
					modelData[i] = rdataList.at(i).asStringArray();
					break;
				}
				rData.put("data", modelData);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return rData;
	}

	@Override
	public Map<String, Object> getSummary(int fileId) {
		Map<String, Object> rData = new Hashtable<String, Object>();

		UploadFileVO file = fileService.getFile(fileId);
		byte[] data = file.getFileData();

		long exp;
		try {
			exp = rEngine.rniPutString(new String(data, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		rEngine.rniAssign("data", exp, 0);

		rEngine.eval("Sys.setlocale(category=\"LC_ALL\", locale=\"English_United States.1252\")");

		rEngine.eval("dataFrame <- read.table(text=data, sep=\",\", fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding=\"UTF-8\", fileEncoding=\"UTF-8\")");

		//R에서 dataFrame을 summary 해서 dfSummary에 저장, REXP 클래스 타입의 summary 객체 생성 
		REXP summary = rEngine.eval("(dfSummary <- summary(dataFrame))");
		if(summary == null)	//summary 할 데이터가 없을 경우 Runtime 예외발생
			throw new RuntimeException("No data for summary");

		//rData라는 맵에 summary한 내용으로 모델(key+value)을 만든다.
		rData.put("summary", summary.asStringArray());

		//R에서 dfSummary의 열이름을 뽑아내서 맵의 colNames 객체를 만든다.
		REXP colNames = rEngine.eval("colnames(dfSummary)");
		//rData라는 맵에 colNames한 내용으로 모델(key+value)을 만든다.
		rData.put("colNames", colNames.asStringArray());

		//R에서 dfSummary의 행의 수를 뽑아내서 맵의 nrow 객체를 만든다.
		REXP nrow = rEngine.eval("nrow(dfSummary)");
		//rData라는 맵에 nrow한 내용으로 모델(key+value)을 만든다.
		rData.put("nrow", nrow.asInt());

		return rData;	//rData 맵 리턴
	}


	@Override
	public SummaryVO getSummaryList(int fileId) {

		UploadFileVO file = fileService.getFile(fileId);
		byte[] data = file.getFileData();

		long exp;
		try {
			exp = rEngine.rniPutString(new String(data, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
		rEngine.rniAssign("data", exp, 0);

		rEngine.eval("Sys.setlocale(category=\"LC_ALL\", locale=\"English_United States.1252\")");

		rEngine.eval("dataFrame <- read.table(text=data, sep=\",\", fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding=\"UTF-8\", fileEncoding=\"UTF-8\")");

		REXP rsummary = rEngine.eval("(dfSummary <- summary(dataFrame))");
		if(rsummary == null)
			throw new RuntimeException("No data for summary");

		SummaryVO summary = new SummaryVO();

		REXP rcolNames = rEngine.eval("colnames(dfSummary)");
		summary.setColNames(rcolNames.asStringArray());
		summary.setValues(rsummary.asStringArray());
		System.out.println(summary);
		return summary;
	}

	//전처리 파트
	public Map<String, Object> getTens(String column) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//나이를 연령대의 첫 숫자로 변환시키는 함수 정의
		rEngine.eval(
				"age_to_gen <- function(row){"
						+ "row=floor(row/10)}"
				);
		//선택열(AGE)에 age_to_gen 적용
		rEngine.eval("data$"+column+"<- sapply(data$"+column+", age_to_gen)");
		REXP result = rEngine.eval("(data)");
		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> ynTo10(String column) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//Y, N 값을 1, 0으로 변환시키는 함수 정의
		rEngine.eval(
				"yn_to_10 <- function(row){"
						+ "if(row==\"Y\") "
						+ "row=1 "
						+ "else "
						+ "if(row==\"N\") "
						+ "row=0 "
						+ "else "
						+ "row=\"\"}"
				);

		//Y, N 값이 있는 열에 yn_to_10 적용
		rEngine.eval("data$"+column+" <- sapply(data$"+column+", yn_to_10)");
		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> naToNumber(String column, int number) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//NA 값을 입력 숫자로 변환시키는 함수 정의
		rEngine.eval(
				"na_to_num <- function(row){"
						+ " if(is.na(row))"
						+ " row=" + number
						+ " else"
						+ " row=row}"
				);

		//NA 값이 있는 열에 na_to_num 적용
		rEngine.eval("data$"+column+"<- sapply(data$"+column+", na_to_num)");

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> stringToNumber(String column) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//지역이름을 숫자로 변환하는 함수 정의
		rEngine.eval(
				"ctpr_to_code <- function(row){"
						+ "if(row==\"서울\")"
						+ " row=1"
						+ " else if(row==\"부산\")"
						+ " row=2"
						+ " else if(row==\"대구\")"
						+ " row=3"
						+ " else if(row==\"인천\")"
						+ " row=4"
						+ " else if(row==\"광주\")"
						+ " row=5"
						+ " else if(row==\"대전\")"
						+ " row=6"
						+ " else if(row==\"울산\")"
						+ " row=7"
						+ " else if(row==\"세종\")"
						+ " row=8"
						+ " else if(row==\"경기\")"
						+ " row=9"
						+ " else if(row==\"강원\")"
						+ " row=10"
						+ " else if(row==\"충북\")"
						+ " row=11"
						+ " else if(row==\"충남\")"
						+ " row=12"
						+ " else if(row==\"전북\")"
						+ " row=13"
						+ " else if(row==\"전남\")"
						+ " row=14"
						+ " else if(row==\"경북\")"
						+ " row=15"
						+ " else if(row==\"경남\")"
						+ " row=16"
						+ " else if(row==\"제주\")"
						+ " row=17"
						+ " else"
						+ " row=0}"
				);

		//지역 열에 함수 적용
		rEngine.eval("data$"+column+"<- sapply(data$"+column+", ctpr_to_code)");

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> getFirstChrToNum(String column) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//직업군 열의 첫 문자(넘버링 돼있음) 추출
		rEngine.eval(
				"firstchr_to_no <- function(row){"
						+ "row=substr(row, 1, 1) "
						+ "if(row==\"\")"
						+ " return(0)"
						+ " else"
						+ " return(as.integer(row))}"
				);

		//각 직업군을 숫자로 표시할 수 있도록 함수 적용
		rEngine.eval("data$"+column+"<- sapply(data$"+column+", firstchr_to_no)");

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> nullToN(String column) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//null 값을 N으로 변환시키는 함수 정의
		rEngine.eval(
				"nullstring_to_N <- function(row){"
						+ "if(row==\"N\")"
						+ " row=\"N\""
						+ " else if(row==\"Y\")"
						+ " row=\"Y\""
						+ " else"
						+ " row=\"N\"}"
				);

		//null 값이 있는 행을 N으로
		rEngine.eval("data$"+column+"<- sapply(data$"+column+", nullstring_to_N)");

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> zeroToMeanByGroup(String groupcol, String datacol) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//datacol을 groupcol에 따라 그룹화하고 평균을 구함 (소득열을 직업군으로 분류하고 직업별 평균 소득을 구하는 함수)
		rEngine.eval("mean_by_group<-round(tapply(data$"+datacol+", data$"+groupcol+", mean))");

		//데이터가 0인 행을 자신이 속한 그룹의 평균 값으로 수정하는 함수 (소득이 0인 사람의 데이터를 직업별 평균 소득으로 수정하는 함수)
		rEngine.eval(
				"zero_to_mean<-function(occp, incm) {"
						+ "if(incm==0)"
						+ " return(mean_by_group[occp+1])"
						+ " else"
						+ " return(incm)}"
				);

		rEngine.eval("data$"+datacol+"<-mapply(zero_to_mean, data$"+groupcol+", data$"+datacol+")");

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}


	public Map<String, Object> colToMeanByGroup(String groupcol, String datacol) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//고객의 입원일수(data_claim$VLID_HOSP_OTDA)를 고객별로 그룹화하고 그룹별 평균을 내는 함수 적용
		rEngine.eval("data$"+datacol+"<-round(tapply(data$"+datacol+", data$"+groupcol+", mean))");

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	public Map<String, Object> getTableByColumns(String[] columns) {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//	      //선택한 열로 테이블 생성하기 for문으로 열의 이름 나열
		//	      rEngine.eval("data <- table("+"data$"+columns[i]+"))");
		//	      //            for(int i=0; i<columns.length; i++){
		//	      //               "+"+""data$""+columns[i]";
		//	      //            };

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);      

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	//저장된 데이터의 모든 열을 대상으로 cast 진행
	public Map<String, Object> getRestructuredData() {

		Map<String, Object> rData = new Hashtable<String, Object>();

		//for 문으로 열의 모든 이름 나열 ? 맨 끝에
		rEngine.eval(

				"install.packages(\"reshape\"); "
						+ "library(resape); "
						+ "data<-as.data.frame(data); "
						+ "names(data) <- c(\"CUST_ID\", \"ACCI_DVSN\", \"DMND_RESN_CODE\", \"value\"); "
						+ "data<-cast(data=data, CUST_ID ~ ACCI_DVSN + DMND_RESN_CODE, fun=sum); "
				);

		REXP result = rEngine.eval("(data)");

		RList rdataList = result.asList();

		String[] keys = rdataList.keys();
		rData.put("colNames", keys);      

		Object[] modelData = new Object[keys.length];

		for(int i=0; i<keys.length; i++) {
			switch(rdataList.at(i).rtype) {
			case REXP.LGLSXP: 
				modelData[i] = rdataList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				modelData[i] = rdataList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				modelData[i] = rdataList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				modelData[i] = rdataList.at(i).asStringArray();
				break;
			}
			rData.put("data", modelData);

		}
		return rData;

	}

	//병합할 데이터 두개 선택 -> 각각의 데이터를 data1, data2에 담고 merge한 데이터를 data_merged 에 담기
	public void getMergedTable(int fileId1, int fileId2) {

		UploadFileVO file1 = fileService.getFile(fileId1);
		byte[] data1 = file1.getFileData();

		long exp1;
		try {
			exp1 = rEngine.rniPutString(new String(data1, "UTF-8"));
			rEngine.rniAssign("data1", exp1, 0);
			rEngine.eval("Sys.setlocale(category=\"LC_ALL\", locale=\"English_United States.1252\")");
			rEngine.eval("data1 <- read.table(text=data1, sep=\",\", fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding=\"UTF-8\", fileEncoding=\"UTF-8\"))");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		UploadFileVO file2 = fileService.getFile(fileId2);
		byte[] data2 = file2.getFileData();

		long exp2;
		try {
			exp2 = rEngine.rniPutString(new String(data2, "UTF-8"));
			rEngine.rniAssign("data2", exp2, 0);
			rEngine.eval("Sys.setlocale(category=\"LC_ALL\", locale=\"English_United States.1252\")");
			rEngine.eval("data2 <- read.table(text=data2, sep=\",\", fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding=\"UTF-8\", fileEncoding=\"UTF-8\"))");

			rEngine.eval("data_merged<-merge(data1, data2); "
					+ "data_merged<-data_merged[, sapply(data_merged, function(v) var(v, na.rm = TRUE)!=0)]");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

	}
	//데이터 샘플링 메서드. write.csv 스크립트도 추가?
	public List<Map<String, Object>> dataSampling(int trainrate, int testrate, String column) {
		Map<String, Object> trainData = new Hashtable<String, Object>();
		Map<String, Object> testData = new Hashtable<String, Object>();
		List<Map<String, Object>> dataSample = new ArrayList<Map<String, Object>>();

		rEngine.eval("idx<-sample(1:nrow(data), nrow(data), replace=FALSE)");
		rEngine.eval("data<-data[idx, ]");

		rEngine.eval("train_set<-[1:floor(nrow(data)*"+trainrate*0.1+"), ]");
		rEngine.eval("train_set<-train_set[order(data$"+column+"), ]");

		rEngine.eval("test_set<-[(floor(nrow(data)*"+trainrate*0.1+")+1):nrow(data), ]");
		rEngine.eval("test_set<-train_set[order(data$"+column+"), ]");

		//train_set을 화면에 출력하기 위한 rData
		REXP trainresult = rEngine.eval("(train_set)");

		RList trainList = trainresult.asList();

		String[] trainkeys = trainList.keys();
		trainData.put("traincols", trainkeys);

		Object[] trainRow = new Object[trainkeys.length];

		for(int i=0; i<trainkeys.length; i++) {
			switch(trainList.at(i).rtype) {
			case REXP.LGLSXP: 
				trainRow[i] = trainList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				trainRow[i] = trainList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				trainRow[i] = trainList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				trainRow[i] = trainList.at(i).asStringArray();
				break;
			}
			trainData.put("traindata", trainRow);

		}
		dataSample.add(trainData);      

		//test_set을 화면에 출력하기 위한 rData
		REXP testresult = rEngine.eval("(test_set)");

		RList testList = testresult.asList();

		String[] testkeys = testList.keys();
		trainData.put("testcols", testkeys);

		Object[] testRow = new Object[testkeys.length];

		for(int i=0; i<testkeys.length; i++) {
			switch(testList.at(i).rtype) {
			case REXP.LGLSXP: 
				testRow[i] = testList.at(i).asBool();
				break;
			case REXP.INTSXP: 
				testRow[i] = testList.at(i).asIntArray();
				break;
			case REXP.REALSXP: 
				testRow[i] = testList.at(i).asDoubleArray();
				break;
			case REXP.STRSXP: 
				testRow[i] = testList.at(i).asStringArray();
				break;
			}
			testData.put("testdata", testRow);

		}
		dataSample.add(testData);
		return dataSample;

	}
	//종속변수를 선택한다고 했을 때
	public void xgboost(String column) {

		rEngine.eval(
				"install.packages('xgboost'); "
						+ "library(xgboost) "
						+ "data <- cbind(subset(data, select=-"+column+"), subset(data, select="+column+") ");      
	}

	// 민구 시각화 연습 서비스 제작 //

	// 일단은 원본데이터 읽기
	@Override
	public ArrayList<SampleVO> getCsvFile(){
		ArrayList<SampleVO> getCsv = new ArrayList<SampleVO>();
		try {
			rEngine.eval("library(dplyr); library(ggplot2);"
					+ "setwd(\"c:R/Workplace\");"
					+ "(data_cust <- read.csv(\"BGCON_CUST_DATA.csv\", header=TRUE, sep=\",\", encoding=\"cp949\", fileEncoding = \"UCS-2\")");
			REXP result1 = rEngine.eval("(cnt_siu <- table(data_cust$SIU_CUST_YN));");

			SampleVO sample1 = new SampleVO();
			sample1.setName("사기자 수");
			// 파이는 타입을 안받는다.
			sample1.setData(result1.asDoubleArray());
			getCsv.add(sample1);

		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return getCsv;
	}

	/*
	 
	 
	// 연령대 별 사기자 수!
	   @Override
	   public ArrayList<RTestVO> getCountByAgeGen() {
	      ArrayList<RTestVO> ageGenList = new ArrayList<RTestVO>();
	      try {
	         REXP result1 = rEngine.eval("(count_by_age_gen <- table(subset(data_cust, select=AGE, subset=(data_cust$SIU_CUST_YN==1))))");
	         REXP result2 = rEngine.eval("names(count_by_age_gen) <- c(\"0대\",\"10대\",\"20대\",\"30대\",\"40대\",\"50대\",\"60대\",\"70대\")");
	         REXP result3 = rEngine.eval("barplot(count_by_age_gen, main = \"연령대별 사기자 수\")");

	      } catch (Exception e) {
	         logger.error(e.getMessage());
	         throw new RuntimeException(e);
	      }
	      return ageGenList;
	   }

	   // 성별 별 사기자 수!
	   @Override
	   public ArrayList<RTestVO> getCountBySex() {
	      ArrayList<RTestVO> sexList = new ArrayList<RTestVO>();
	      try {
	         REXP result1 = rEngine.eval("(count_by_sex <- table(subset(data_cust, select=SEX, subset=(data_cust$SIU_CUST_YN==1))))");
	         REXP result2 = rEngine.eval("names(count_by_sex) <- c(\"남자\", \"여자\")");
	         REXP result3 = rEngine.eval("pie(count_by_sex, cex=0.8, main=\"성별별 사기자 수\", labels=paste(names(count_by_sex), \"\\n\", A. count_by_sex, \"명\", \"\\n\", B. round(count_by_sex/sum(count_by_sex)*100), \"%\"))");

	      } catch (Exception e) {
	         logger.error(e.getMessage());
	         throw new RuntimeException(e);
	      }
	      return sexList;
	   }
		*/

}


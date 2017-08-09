package kr.kosa.destiny.analytics.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
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

	// iris 막대 차트 구현부
	@Override
	public ArrayList<SampleVO> getAvgPetalBySpecies2() {
		ArrayList<SampleVO> irisList = new ArrayList<SampleVO>();
		try {
			// String[] species = {"setosa", "versicolor", "virginica"};
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


	// iris 파이차트 구현부!!!
	@Override
	public ArrayList<SampleVO1> getAvgPetalBySpecies3() {
		ArrayList<SampleVO1> irisList = new ArrayList<SampleVO1>();
		try {
			REXP result = rEngine.eval("(ming <- tapply(iris$Petal.Length, iris$Species, mean))");
			REXP result1 = rEngine.eval("names(ming)");

			double resultList[] = result.asDoubleArray();
			String resultList1[] = result1.asStringArray();

			for (int i = 0; i < resultList.length; i++) {
				SampleVO1 sample1 = new SampleVO1();
				sample1.setName(resultList1[i]);
				sample1.setY(resultList[i]);
				irisList.add(sample1);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return irisList;
	}

	// 꺾은선 그래프로 등급별 사기자 수 확인하려고 했는데 일단 보류!!!
	/*
	 * @Override public ArrayList<SampleVO1> getBymincrdt() {
	 * ArrayList<SampleVO1> siuList = new ArrayList<SampleVO1>(); try {
	 * rEngine.eval("setwd(\"c:R/Workplace\")"); rEngine.
	 * eval("(data_cust <- read.csv(\"BGCON_CUST_DATA.csv\", header=TRUE, sep=\",\", encoding=\"cp949\", fileEncoding = \"UCS-2\"))"
	 * ); rEngine.
	 * eval("(yn_to_10 <- function(row){if(row==\"Y\" row = 1 else if(row==\"N\") row = 0  else row = \"\")})"
	 * ); rEngine.
	 * eval("(data_cust$SIU_CUST_YN <- sapply(data_cust$SIU_CUST_YN, yn_to_10))"
	 * ); rEngine.
	 * eval("(na_to_6 <- function(row){if(is.na(row)) row = 6 else row = row})"
	 * );
	 * rEngine.eval("(data_cust$MINCRDT <- sapply(data_cust$MINCRDT, na_to_6))"
	 * ); rEngine.
	 * eval("(count_by_crdt <- table(subset(data_cust, select = MINCRDT, subset=(data_cust$SIU_CUST_YN==1))))"
	 * ); REXP result = rEngine.eval("as.vector(count_by_crdt)"); rEngine.
	 * eval("(names(count_by_crdt) <- c(\"등급없음\",\"1등급\",\"2등급\",\"3등급\",\"4등급\",\"5등급\",\"6등급\",\"7등급\",\"8등급\",\"9등급\",\"10등급\")"
	 * ); REXP result1 = rEngine.eval("names(count_by_crdt)");
	 * 
	 * int resultList[] = result.asIntArray(); String resultList1[] =
	 * result1.asStringArray();
	 * 
	 * for (int i=0; i<resultList.length; i++){ SampleVO1 sample1 = new
	 * SampleVO1(); sample1.setName(resultList1[i]);
	 * sample1.setData(resultList[i]); siuList.add(sample1); } } catch
	 * (Exception e) { logger.error(e.getMessage()); throw new
	 * RuntimeException(e); } return siuList; }
	 */

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

	public Map<String, Object> analyticsDatabaseInfo(String fileName) {

		//rData안에 객체를 매핑시킬때 String, Object 타입으로 put해줘야 한다는 것을 의미.
		Map<String, Object> rData = new Hashtable<String, Object>();

		UploadFileVO file = fileService.getNameFile(fileName);
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
		//System.out.println(summary);
		return summary;
	}
	// 전처리 파트
	   @Override
	   //NA 값이 있는 index 값을 알려줌
	   public List<String> getNaIndex(String column){
	      //      rEngine.eval("setwd('D:/Projects/DAIA_R Prj/Workplace')");
	      //      rEngine.eval("data<-read.csv('data/data_cust_1-1.csv', header=TRUE)"); 
	      REXP result = rEngine.eval("as.character(is.na(data$"+column+"))");
	      String[] isNa = result.asStringArray();
	      List<String> nalist=Arrays.asList(isNa);

	      return nalist;
	      //nalist.indexOf("TRUE"); -> 배열에서 TRUE 값이 있는 위치(인덱스)값을 반환 
	   }

	   @Override
	   public Map<String, Object> getTens(String column) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // 나이를 연령대의 첫 숫자로 변환시키는 함수 정의
	      rEngine.eval("age_to_gen <- function(row){ row=floor(row/10)}");
	      // 선택열(AGE)에 age_to_gen 적용
	      rEngine.eval("data$" + column + "<- sapply(data$" + column + ", age_to_gen)");
	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];

	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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
	   @Override
	   public Map<String, Object> ynTo10(String column) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // Y, N 값을 1, 0으로 변환시키는 함수 정의
	      rEngine.eval("yn_to_10 <- function(row){if(row=='Y') row=1 else if(row=='N') row=0 else row=''}");
	      // Y, N 값이 있는 열에 yn_to_10 적용
	      rEngine.eval("data$" + column + " <- sapply(data$" + column + ", yn_to_10)");
	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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

	   @Override
	   public Map<String, Object> naToNumber(String column, int number) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // NA 값을 입력 숫자로 변환시키는 함수 정의
	      rEngine.eval("na_to_num <- function(row){if(is.na(row)) row=" + number + " else row=row}");
	      // NA 값이 있는 열에 na_to_num 적용
	      rEngine.eval("data$" + column + "<- sapply(data$" + column + ", na_to_num)");

	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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
	   
	   @Override
	   public Map<String, Object> stringToNumber(String column) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // 지역이름을 숫자로 변환하는 함수 정의
	      rEngine.eval("ctpr_to_code <- function(row){" + "if(row==\"서울\")" + " row=1" + " else if(row==\"부산\")"
	            + " row=2" + " else if(row==\"대구\")" + " row=3" + " else if(row==\"인천\")" + " row=4"
	            + " else if(row==\"광주\")" + " row=5" + " else if(row==\"대전\")" + " row=6" + " else if(row==\"울산\")"
	            + " row=7" + " else if(row==\"세종\")" + " row=8" + " else if(row==\"경기\")" + " row=9"
	            + " else if(row==\"강원\")" + " row=10" + " else if(row==\"충북\")" + " row=11" + " else if(row==\"충남\")"
	            + " row=12" + " else if(row==\"전북\")" + " row=13" + " else if(row==\"전남\")" + " row=14"
	            + " else if(row==\"경북\")" + " row=15" + " else if(row==\"경남\")" + " row=16" + " else if(row==\"제주\")"
	            + " row=17" + " else" + " row=0}");
	      // 지역 열에 함수 적용
	      rEngine.eval("data$" + column + "<- sapply(data$" + column + ", ctpr_to_code)");

	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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
	   
	   @Override
	   public Map<String, Object> getFirstChrToNum(String column) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // 직업군 열의 첫 문자(넘버링 돼있음) 추출
	      rEngine.eval(
	            "firstchr_to_no <- function(row){"
	                  +"row=substr(row, 1, 1)\n"
	                  +"if(row=='')\n"
	                  +"return(0)\n"
	                  +"else\n"
	                  +"return(as.integer(row))}");
	      // 각 직업군을 숫자로 표시할 수 있도록 함수 적용
	      rEngine.eval("data$" + column + "<- sapply(data$" + column + ", firstchr_to_no)");
	      
	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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
	   
	   @Override
	   public Map<String, Object> nullToN(String column) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // null 값을 N으로 변환시키는 함수 정의
	      rEngine.eval("nullstring_to_N <- function(row){if(row==\"N\") row=\"N\" else if(row==\"Y\") row=\"Y\" else row=\"N\"}");
	      // null 값이 있는 행을 N으로
	      rEngine.eval("data$" + column + "<- sapply(data$" + column + ", nullstring_to_N)");

	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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
	   
	   @Override
	   public Map<String, Object> zeroToMeanByGroup(String groupcol, String datacol) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // datacol을 groupcol에 따라 그룹화하고 평균을 구함 (소득열을 직업군으로 분류하고 직업별 평균 소득을 구하는 함수)
	      rEngine.eval("mean_by_group<-tapply(data$" + datacol + ", data$" + groupcol + ", mean)");
	      rEngine.eval("mean_by_group<-round(mean_by_group)");

	      // 데이터가 0인 행을 자신이 속한 그룹의 평균 값으로 수정하는 함수 (소득이 0인 사람의 데이터를 직업별 평균 소득으로 수정하는 함수)
	      rEngine.eval("zero_to_mean<-function(occp, incm){\n"
	            + "if(incm==0)\n"
	            + "return(mean_by_group[occp+1])\n"
	            + "else\n"
	            + "return(incm)}");

	      rEngine.eval("data$" + datacol + "<-mapply(zero_to_mean, data$" + groupcol + ", data$" + datacol + ")");

	      REXP result = rEngine.eval("data");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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
	   
	   @Override
	   public Map<String, Object> colToMeanByGroup(String groupcol, String datacol) {
	      Map<String, Object> rData = new Hashtable<String, Object>();
	      // 고객의 입원일수(data_claim$VLID_HOSP_OTDA)를 고객별로 그룹화하고 그룹별 평균을 내는 함수 적용
	      rEngine.eval("hosp_day_per_cust<-aggregate(data$"+datacol+", by=list(data$"+groupcol+"), mean)");
	      rEngine.eval(
	            "names(hosp_day_per_cust) <- c('"+groupcol+"', '"+datacol+"')"
	            );
	      rEngine.eval(
	            "hosp_day_per_cust$"+datacol+" <- round(hosp_day_per_cust$"+datacol+")"
	            );

	      REXP result = rEngine.eval("hosp_day_per_cust");
	      RList rdataList = result.asList();

	      String[] keys = rdataList.keys();
	      rData.put("colNames", keys);

	      Object[] modelData = new Object[keys.length];
	      for (int i = 0; i < keys.length; i++) {
	         switch (rdataList.at(i).rtype) {
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

	   //   저장된 데이터의 모든 열을 대상으로 cast 진행 (재구조화 대상 열을 선택하고 별도의 파일로 저장한 상태에서 실행)
	   @Override
	   public void getRestructuredData() {
	      //      rEngine.eval("setwd('D:/Projects/DAIA_R Prj/Workplace')");
	      //      rEngine.eval("data<-read.csv('data/data_cast.csv', header=TRUE)");

	      //      rEngine.eval("install.packages('reshape')"); -> personal library 사용 확인 
	      rEngine.eval("library(reshape)");

	      String[] colnames = rEngine.eval("colnames(data)").asStringArray();
	      //마지막 열을 분해해서 옆으로 정렬함
	      rEngine.eval("data<-cast(data=data, "+colnames[0]+" ~ "+colnames[colnames.length-2]+" + "+colnames[colnames.length-1]+", fun=sum)");
	      //데이터 저장 주소, 이름 재설정 필요
	      rEngine.eval("write.csv(data, 'data/data_cast7.csv', row.names = FALSE)");
	      //리턴 값은 무엇으로?

	   }

	   // 병합할 데이터 두개 선택 -> 각각의 데이터를 data1, data2에 담고 merge한 데이터를 data_merged 에 담기
	   @Override
	   public void getMergedTable(int fileId1, int fileId2) {

	      UploadFileVO file1 = fileService.getFile(fileId1);
	      byte[] data1 = file1.getFileData();

	      long exp1;
	      try {
	         exp1 = rEngine.rniPutString(new String(data1, "UTF-8"));
	         rEngine.rniAssign("data1", exp1, 0);
	         rEngine.eval("Sys.setlocale(category='LC_ALL', locale='English_United States.1252')");
	         rEngine.eval(
	               "data1 <- read.table(text=data1, sep=',', fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding='UTF-8', fileEncoding='UTF-8')");
	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }

	      UploadFileVO file2 = fileService.getFile(fileId2);
	      byte[] data2 = file2.getFileData();

	      long exp2;
	      try {
	         exp2 = rEngine.rniPutString(new String(data2, "UTF-8"));
	         rEngine.rniAssign("data2", exp2, 0);
	         rEngine.eval("Sys.setlocale(category='LC_ALL', locale='English_United States.1252')");
	         rEngine.eval(
	               "data2 <- read.table(text=data1, sep=',', fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding='UTF-8', fileEncoding='UTF-8')");

	         rEngine.eval("data_merged<-merge(data1, data2)");
	         //merge 하면서 분산이 0인 열 삭제 -> 병합 테이블 출력시 rData 리턴
	         rEngine.eval("data_merged<-data_merged[, sapply(data_merged, function(v) var(v, na.rm = TRUE)!=0)]");

	      } catch (UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }

	   }

	   // 데이터 샘플링 메서드. trainset 비율, testset 비율, 정렬기준 열을 파라미터로 받아 옴
	   @Override
	   public List<Map<String, Object>> dataSampling(double trainrate, String column) {

	      Map<String, Object> trainData = new Hashtable<String, Object>();
	      Map<String, Object> testData = new Hashtable<String, Object>();
	      List<Map<String, Object>> dataSample = new ArrayList<Map<String, Object>>();

	      rEngine.eval("idx<-sample(1:nrow(data), nrow(data), replace=FALSE)");
	      rEngine.eval("data<-data[idx, ]");

	      rEngine.eval("train_set<-data[1:floor(nrow(data)*" + trainrate +"), ]");
	      rEngine.eval("train_set<-train_set[order(train_set$" + column + "), ]");

	      rEngine.eval("test_set<-data[(floor(nrow(data)*" + trainrate +")+1):nrow(data), ]");
	      rEngine.eval("test_set<-train_set[order(test_set$" + column + "), ]");

	      // train_set을 화면에 출력하기 위한 rData
	      REXP trainresult = rEngine.eval("(train_set)");

	      RList trainList = trainresult.asList();

	      String[] trainkeys = trainList.keys();
	      trainData.put("traincols", trainkeys);

	      Object[] trainRow = new Object[trainkeys.length];

	      for (int i = 0; i < trainkeys.length; i++) {
	         switch (trainList.at(i).rtype) {
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

	      // test_set을 화면에 출력하기 위한 rData
	      REXP testresult = rEngine.eval("(test_set)");

	      RList testList = testresult.asList();

	      String[] testkeys = testList.keys();
	      trainData.put("testcols", testkeys);

	      Object[] testRow = new Object[testkeys.length];

	      for (int i = 0; i < testkeys.length; i++) {
	         switch (testList.at(i).rtype) {
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

	   //xgboost 분석 : 종속변수, 제거 열을 선택한다고 했을 때
	   @Override
	   public void xgboost(String independentvar, String primecol) {
	      //train_set 생성 : 종속변수를 오른쪽으로 두고 분석에 관계없는 열(primekey) 제거 
	      rEngine.eval("install.packages('xgboost')");
	      rEngine.eval("library(xgboost)");
	      rEngine.eval("train_set <- cbind(subset(train_set, select=-"+independentvar+"), subset(data, select="+independentvar+")) ");
	      rEngine.eval("train_set <- subset(train_set, select=-"+primecol+")");

	      //분석을 위한 데이터 생성 : 종속변수만 있는 데이터(y), train_set에서 종속변수 제거(x)
	      rEngine.eval("y<-train_set[,ncol(train_set)]");
	      rEngine.eval("x<-subset(train_set, select=-"+independentvar+")");
	      rEngine.eval("x<-as.matrix(x)");
	      rEngine.eval("x<-matrix(suppressWarnings(as.numeric(x)), nrow(x), ncol(x))");

	      //xgboost 의 param 생성 : num_class는 분류 수
	      rEngine.eval("param <- list('objective' = 'multi:softprob', ");
	      rEngine.eval("'eval_metric' = 'mlogloss', ");
	      rEngine.eval("'num_class' = 2, ");
	      rEngine.eval("'nthread' = 8)");

	      //         rEngine.eval(
	      //               "bst_model <- xgboost(param=param, data=x[1:length(y), ], nrounds=1000, label=y, missing=NaN)"
	      //               ); nrounds ?

	      //test_set 생성
	      rEngine.eval("test_set_yn <- subset(test_set, select=c("+primecol+","+independentvar+"))");
	      rEngine.eval("test_set <- subset(test_set, select=-"+independentvar+")");
	      rEngine.eval("test_set <- subset(test_set, select=-"+primecol+")");

	      //test_set으로 예측
	      rEngine.eval("x_test <- as.matrix(cust_test)");
	      rEngine.eval("x_test <- matrix(suppressWarnings(as.numeric(x_test)), nrow(x_test), ncol(x_test))");
	      rEngine.eval("predicted_data <- predict(bst_model, x_test, missing=NaN)");
	      rEngine.eval("predicted_data <- matrix(predicted_data, ncol=2, nrow=length(predicted_data)/2, byrow=TRUE)");
	      rEngine.eval("predicted_yn <- max.col(predicted_data)");
	      rEngine.eval("yn12_to_01 <- function(row) {if(row == 1) row = 0 else if(row == 2) row = 1 else row=row}");
	      rEngine.eval("predicted_yn <- sapply(predicted_yn, yn12_to_01)");
	      rEngine.eval("xgb_result <- cbind(test_set_yn, predicted_yn)"
	            );
	      //데이터 출력할 경우
	      //         REXP result = rEngine.eval("xgb_result");
	      //
	      //         RList rdataList = result.asList();
	      //
	      //         String[] keys = rdataList.keys();
	      //         rData.put("colNames", keys);      
	      //
	      //         Object[] modelData = new Object[keys.length];
	      //
	      //         for(int i=0; i<keys.length; i++) {
	      //            switch(rdataList.at(i).rtype) {
	      //            case REXP.LGLSXP: 
	      //               modelData[i] = rdataList.at(i).asBool();
	      //               break;
	      //            case REXP.INTSXP: 
	      //               modelData[i] = rdataList.at(i).asIntArray();
	      //               break;
	      //            case REXP.REALSXP: 
	      //               modelData[i] = rdataList.at(i).asDoubleArray();
	      //               break;
	      //            case REXP.STRSXP: 
	      //               modelData[i] = rdataList.at(i).asStringArray();
	      //               break;
	      //            }
	      //            rData.put("data", modelData);
	      //
	      //         }
	      //         return rData;
	   }
	   
	   @Override
	   public void nnet(String independentvar, String primekey) {
	      rEngine.eval("install.packages('nnet')");
	      rEngine.eval("library(nnet)");
	      rEngine.eval("test_set_yn<-subset(test_set, select=c("+primekey+", "+independentvar+")");

	      rEngine.eval(
	            "x<-subset(train_set, select=-c("+primekey+", "+independentvar+")");
	      rEngine.eval("y<-subset(train_set, select="+independentvar+")");
	      rEngine.eval("test_set<-subset(test_set, select=-c("+primekey+", "+independentvar+")");

	      rEngine.eval("nnet(x, y, size=30, na.action=na.omit, rang=0.1, abstol=0.0001, maxit=500, MaxNWts=30000, decay=0.05)");
	      rEngine.eval("nnet_predicted_data<-predict(nnet_model, test_set)");
	      rEngine.eval("nnet_predicted_yn<-round(nnet_predicted_data)");
	      rEngine.eval("nne_result<-cbind(test_set_yn, nnet_predicted_yn)");
	   }

	   @Override
	   public void e1071(String independentvar, String primekey) {
	      rEngine.eval("install.packages('e1071')");
	      rEngine.eval("library(e1071)");
	      rEngine.eval("test_set_yn<-subset(test_set, select=c("+primekey+", "+independentvar+")");

	      rEngine.eval("x<-subset(train_set, select=-c("+primekey+", "+independentvar+"); ");
	      rEngine.eval("y<-subset(train_set, select="+independentvar+"); ");
	      rEngine.eval("test_set<-subset(test_set, select=-c("+primekey+", "+independentvar+")");

	      rEngine.eval("x<-x[, sapply(x, function(v) var(v, na.rm=TRUE)!=0)]");
	      rEngine.eval("Sys.time()");
	      rEngine.eval("svm_model<-svm(x, y, scale=TRUE, cross=10, type='C-classification', kernel='radial')");
	      rEngine.eval("Sys.time()");

	      rEngine.eval("test_set<-test_set[, sapply(test_set, function(v) var(v, na.rm=TRUE)!=0)]");
	      rEngine.eval("svm_predicted_data<-predict(svm_model, test_set)");
	      rEngine.eval("svm_result<-cbind(test_set_yn, svm_predicted_data)");
	   }

	@Override
	public ArrayList<SampleVO> getCsvFile() {
		// TODO Auto-generated method stub
		return null;
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


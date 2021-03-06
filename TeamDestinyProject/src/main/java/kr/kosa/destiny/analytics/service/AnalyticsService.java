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

import kr.kosa.destiny.analytics.model.Graph2DVO;
import kr.kosa.destiny.analytics.model.Graph3DVO;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;

@Service
public class AnalyticsService implements IAnalyticsService {

	private static final Logger logger = LoggerFactory.getLogger(AnalyticsService.class);

	@Autowired
	Rengine rEngine;

	@Autowired
	IUploadFileService fileService;

	public Map<String, Object> analyticsDatabaseInfo(int fileId) {
		//rData안에 객체를 매핑시킬때 String, Object 타입으로 put해줘야 한다는 것을 의미.
		Map<String, Object> rData = new Hashtable<String, Object>();

		UploadFileVO file = fileService.getFile(fileId);
		byte[] data = file.getFileData();
		//      logger.info(new String(data));
		try {
			//DB에 저장된 파일형식을 R이 읽을 수 있도록 변환하는 변수 -> exp
			long exp = rEngine.rniPutString(new String(data, "UTF-8"));
			//R에서 "data"라는 변수를 사용하기 위해 exp를 전역변수형태로 전달하는 메서드(0을 사용하면 전역변수로 지정가능)
			rEngine.rniAssign("data", exp, 0);

			//eval은 R에게 스크립트를 실행하라고 전달하는 메서드. setlocale은 언어를 설정해주는 것.
			rEngine.eval("Sys.setlocale(category=\"LC_ALL\", locale=\"English_United States.1252\")");

			//R스크립트를 변수로 선언하려면 데이터타입을 REXP로 해야한다. 스크립트 안의 내용은 R의 data변수를 읽어서 dataFrame이라는 변수로 지정한 후 JAVA의 rdataFrame 변수로 선언. ()를 통해 실행까지 시킴
			REXP rdataFrame = rEngine.eval("(data <- read.table(text=data, sep=\",\", fill=TRUE, header=TRUE, stringsAsFactors=FALSE, skipNul=TRUE, encoding=\"UTF-8\", fileEncoding=\"UTF-8\"))");

			//R에서 규정한 data를 list형식으로 바꿔주고 JAVA에서 RList로 사용하겠다.
			RList rdataList = rdataFrame.asList();
			//         System.out.println(rdataList.toString());

			//R데이터의 리스트의 key를 String배열타입의 keys객체에 저장. keys는 열의 개수(40)
			String[] keys = rdataList.keys();

			//rData 변수에 String, Object 타입으로 put.
			rData.put("colNames", keys);

			//Object[]로 만들어야 여러 데이터 타입들을 가져올 수 있다.
			Object[] modelData = new Object[keys.length];
			//열 이름들을 출력하기 위해 향상된 for 반복문으로 keys의 길이만큼 key값을 반복시킨다.
			//         for(String key : keys) {
			//            System.out.print(key + "\t");
			//         }
			//         System.out.println();   
			//         System.out.print(keys.length);

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

	//데이터 요약정보 출력
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
		if(summary == null)   //summary 할 데이터가 없을 경우 Runtime 예외발생
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

		return rData;   //rData 맵 리턴
	}

	//데이터 전처리 파트
	@Override
	public List<Map<String, String[]>> ynTo10(String[] column) {

		List<Map<String, String[]>> rData = new ArrayList<Map<String, String[]>>();   

		rEngine.eval("yn_to_10 <- function(row){if(row=='Y') row='1' else if(row=='N') row='0' else row=''}");

		// Y, N 값이 있는 열에 yn_to_10 적용
		for(int i=0; i<column.length; i++) {
			Map<String, String[]> tmp = new Hashtable<String, String[]>();      
			String ta = column[i];
			rEngine.eval("data$" + ta + " <- sapply(data$" + ta + ", yn_to_10)");
			REXP column2 = rEngine.eval("head(data$" + ta + ", 5)");
			System.out.println(column2);

			tmp.put(column[i], column2.asStringArray());
			rData.add(tmp);   
		}      
		return rData;
	} 

	@Override
	public List<Map<String, String[]>> nullToN(String[] column) {
		List<Map<String, String[]>> rData = new ArrayList<Map<String, String[]>>();   
		// null 값을 N으로 변환시키는 함수 정의
		rEngine.eval("nullstring_to_N <- function(row){if(row==\"N\") row=\"N\" else if(row==\"Y\") row=\"Y\" else row=\"N\"}");
		// null 값이 있는 행을 N으로
		for(int i=0; i<column.length; i++) {
			Map<String, String[]> tmp = new Hashtable<String, String[]>();      
			String ta = column[i];
			rEngine.eval("data$" + ta + " <- sapply(data$" + ta + ", nullstring_to_N)");
			REXP column2 = rEngine.eval("head(data$" + ta + ", 5)");
			System.out.println(column2);

			tmp.put(column[i], column2.asStringArray());
			rData.add(tmp);   
		}      
		return rData;
	}

	@Override
	public List<Map<String, String[]>> naTo6(String[] column) {
		List<Map<String, String[]>> rData = new ArrayList<Map<String, String[]>>();   

		rEngine.eval("(na_to_6 <- function(row) {if(row==\"-2147483648\") row=6 else row=row})");

		for(int i=0; i<column.length; i++) {
			Map<String, String[]> tmp = new Hashtable<String, String[]>();      

			rEngine.eval("data$" + column[i] + " <- sapply(data$" + column[i] + ", na_to_6)");
			REXP column2 = rEngine.eval("head(data$" + column[i] + ", 5)");
			System.out.println(column2);

			tmp.put(column[i], column2.asStringArray());
			rData.add(tmp);   
		}  
		return rData;
	} 

	@Override
	public List<Map<String, String[]>> naToNumber(String[] column, int number) {
		List<Map<String, String[]>> rData = new ArrayList<Map<String, String[]>>();
		// NA 값을 입력 숫자로 변환시키는 함수 정의
		rEngine.eval("na_to_num <- function(row){if(is.na(row)) row=" + number + " else row=row}");
		// NA 값이 있는 열에 na_to_num 적용

		for(int i=0; i<column.length; i++) {
			Map<String, String[]> tmp = new Hashtable<String, String[]>();      

			rEngine.eval("data$" + column[i] + " <- sapply(data$" + column[i] + ", na_to_num)");
			REXP column2 = rEngine.eval("head(data$" + column[i] + ", 5)");
			System.out.println(column2);

			tmp.put(column[i], column2.asStringArray());
			rData.add(tmp);   
		}   

		return rData;
	}

	@Override
	public Map<String, Integer> min(String[] chkValue) {
		return null;
	}

	@Override
	public Map<String, Integer> max(String[] chkValue) {
		return null;
	}

	// 고객의 입원일수(data_claim$VLID_HOSP_OTDA)를 고객별로 그룹화하고 그룹별 평균을 내는 메서드.
	@Override
	public Map<String, Object> colToMeanByGroup(String groupcol, String datacol) {
		Map<String, Object> rData = new Hashtable<String, Object>();

		rEngine.eval("hosp_day_per_cust<-aggregate(data$"+datacol+", by=list(data$"+groupcol+"), mean)");
		rEngine.eval("names(hosp_day_per_cust) <- c('"+groupcol+"', '"+datacol+"')");
		rEngine.eval("hosp_day_per_cust$"+datacol+" <- round(hosp_day_per_cust$"+datacol+")");

		return rData;
	}


	//저장된 데이터의 모든 열을 대상으로 cast 진행 (재구조화 대상 열을 선택하고 별도의 파일로 저장한 상태에서 실행)
	@Override
	public void getRestructuredData(String[] column) {

		rEngine.eval("acci_dmnd_count<-table(data_claim$"+column[0]+", data_claim$"+column[1]+", data_claim$"+column[2]+")");
		rEngine.eval("acci_dmnd_count<-as.data.frame(acci_dmnd_count)");
		REXP cols = rEngine.eval("names(acci_dmnd_count)<-c('"+column[0]+"', '"+column[1]+"', '"+column[2]+"', 'value')");

		String[] colnames = cols.asStringArray();
		rEngine.eval("library(reshape)");
		rEngine.eval("data_cast<-cast(data=acci_dmnd_count, "+colnames[0]+" ~ "+colnames[colnames.length-3]+" + "+colnames[colnames.length-2]+", fun=sum)");

	}

	//병합할 데이터 두개 선택 -> 각각의 데이터를 data1, data2에 담고 merge한 데이터를 data_merged 에 담기
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
		rEngine.eval("xgb_result <- cbind(test_set_yn, predicted_yn)");
		
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
	}



	@Override
	public ArrayList<Graph2DVO> getCsvFile() {
		ArrayList<Graph2DVO> getCsv = new ArrayList<Graph2DVO>();
		try {
			rEngine.eval(
					"(data_cust <- read.csv(\"http://erotic-chaos.com/wp-content/uploads/2017/08/data_cust_1-3.csv\", header=TRUE, sep=\",\", encoding=\"utf-8\", fileEncoding = \"utf-8\"))");
			rEngine.eval("(cnt_siu <- table(data_cust$SIU_CUST_YN))");
			rEngine.eval("(names(cnt_siu) <- c(\"정상인\", \"사기자\"))"); //\"분석대상\", 
			rEngine.eval("as.data.frame(cnt_siu))");
			REXP result = rEngine.eval("as.vector(cnt_siu)");
			REXP result1 = rEngine.eval("(names(cnt_siu))");

			int resultList[] = result.asIntArray();
			String resultList1[] = result1.asStringArray();

			for (int i = 0; i < resultList.length; i++) {
				Graph2DVO sample1 = new Graph2DVO();
				sample1.setName(resultList1[i]);
				sample1.setY(resultList[i]);
				getCsv.add(sample1);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return getCsv;
	}

	@Override
	public ArrayList<Graph2DVO> getMarriedSiu() {
		ArrayList<Graph2DVO> getMarried = new ArrayList<Graph2DVO>();
		try {
			rEngine.eval(
					"(data_cust <- read.csv(\"http://erotic-chaos.com/wp-content/uploads/2017/08/data_cust_1-3.csv\", header=TRUE, sep=\",\", encoding=\"utf-8\", fileEncoding = \"utf-8\"))");
			rEngine.eval("(cnt_wedd <- table(subset(data_cust, select=WEDD_YN, subset=(data_cust$SIU_CUST_YN==1))))");
			rEngine.eval("(names(cnt_wedd) <- c(\"미혼사기자\", \"결혼사기자\"))");
			REXP result = rEngine.eval("as.vector(cnt_wedd)");
			REXP result1 = rEngine.eval("names(cnt_wedd)");


			int resultList[] = result.asIntArray();
			String resultList1[] = result1.asStringArray();

			for (int i = 0; i < resultList1.length; i++) {
				Graph2DVO sample1 = new Graph2DVO();
				sample1.setName(resultList1[i]);
				sample1.setY(resultList[i]);
				getMarried.add(sample1);
			}


		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return getMarried;
	}

	//검정통계량
	@Override
	public ArrayList<Graph3DVO> getBlackML(){
		ArrayList<Graph3DVO> getBlack = new ArrayList<Graph3DVO>();
		try{
			rEngine.eval("(fun_fmeasure <- function(table){\n"
					+ "precision <- table[2,2]/(table[1,2]+table[2,2])\n"
					+ "recall <- table[2,2]/(table[2,1]+table[2,2])\n"
					+ "return(2*precision*recall/(precision+recall))})");

			rEngine.eval("(result1 <- read.csv(\"http://erotic-chaos.com/wp-content/uploads/2017/08/result_xgboost.csv\", header=TRUE, sep=\",\", encoding=\"utf-8\", fileEncoding = \"utf-8\"))");
			rEngine.eval("(temp1 <- table(result1$SIU_CUST_YN, result1$predicted_yn))");
			REXP result1 = rEngine.eval("(fun_fmeasure(temp1))");

			rEngine.eval("(result2 <- read.csv(\"http://erotic-chaos.com/wp-content/uploads/2017/08/result_nnet.csv\", header=TRUE, sep=\",\", encoding=\"utf-8\", fileEncoding = \"utf-8\"))");
			rEngine.eval("(temp2 <- table(result2$SIU_CUST_YN, result2$SIU_CUST_YN.1))");
			REXP result2 = rEngine.eval("(fun_fmeasure(temp2))");

			rEngine.eval("(result3 <- read.csv(\"http://erotic-chaos.com/wp-content/uploads/2017/08/result_svm.csv\", header=TRUE, sep=\",\", encoding=\"utf-8\", fileEncoding = \"utf-8\"))");
			rEngine.eval("(temp3 <- table(result3$SIU_CUST_YN, result3$svm_predicted_data))");
			REXP result3 = rEngine.eval("(fun_fmeasure(temp3))");

			Graph3DVO sample1 = new Graph3DVO();
			sample1.setName("XG_Boost 검정값");
			sample1.setData(result1.asDoubleArray());
			getBlack.add(sample1);

			Graph3DVO sample2 = new Graph3DVO();
			sample2.setName("NNET 검정값");
			sample2.setData(result2.asDoubleArray());
			getBlack.add(sample2);

			Graph3DVO sample3 = new Graph3DVO();
			sample3.setName("E1071 검정값");
			sample3.setData(result3.asDoubleArray());
			getBlack.add(sample3);

		} catch (Exception e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e);
		}
		return getBlack;
	}
}
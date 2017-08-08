package kr.kosa.destiny.analytics.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kr.kosa.destiny.analytics.model.IrisVO;
import kr.kosa.destiny.analytics.model.SampleVO;
import kr.kosa.destiny.analytics.model.SampleVO1;
import kr.kosa.destiny.analytics.service.IAnalyticsService;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;
import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

@Controller
public class AnalyticsController {

	@Autowired
	IAnalyticsService analyticsService;

	@Autowired
	IUploadFileService uploadFileService;

	@RequestMapping("/analytics/iris")
	public String getAvgPetalbySpecies(Model model) {
		ArrayList<IrisVO> irisList = analyticsService.getAvgPetalBySpecies();
		Gson gson = new Gson();
		String irisData = gson.toJson(irisList);
		model.addAttribute("irisData", irisData);

		return "analytics/iris_chart";
	}

	// 막대그래프 구현부
	@RequestMapping("/analytics/iris2")
	public String getAvgPetalbySpecies2(Model model) {
		ArrayList<SampleVO> irisList = analyticsService.getAvgPetalBySpecies2();
		Gson gson = new Gson();
		String irisData = gson.toJson(irisList);
		model.addAttribute("irisData", irisData);

		return "analytics/visual";
	}

	// 파이차트 구현부
	/*
	 * @RequestMapping("/analytics/iris3") public String
	 * getAvgPetalbySpecies3(Model model) { ArrayList<SampleVO1> irisList =
	 * analyticsService.getAvgPetalBySpecies3(); Gson gson = new Gson(); String
	 * irisData = gson.toJson(irisList); model.addAttribute("irisData2",
	 * irisData);
	 * 
	 * return "analytics/visual"; }
	 */

	// 파이차트로 사기자 구분
	@RequestMapping("/analytics/iris3")
	public String getCsvFile(Model model) {
		ArrayList<SampleVO> getCsv = analyticsService.getCsvFile();
		Gson gson = new Gson();
		String gcv = gson.toJson(getCsv);
		model.addAttribute("gcv", gcv);

		return "analytics/visual";
	}

	// 라인그래프로 사기자 분포 확인하려고 했는데 보류...
	/*
	 * @RequestMapping("/analytics/iris4") public String getBymincrdt(Model
	 * model) { ArrayList<SampleVO1> siuList = analyticsService.getBymincrdt();
	 * Gson gson = new Gson(); String siu = gson.toJson(siuList);
	 * model.addAttribute("siu", siu);
	 * 
	 * return "analytics/visual"; }
	 */

	@RequestMapping("/analytics/database/{fileId}")
	public String analyticsDatabase(@PathVariable int fileId, Model model) {
		ArrayList<SampleVO> irisList = analyticsService.analyticsDatabase(fileId);
		Gson gson = new Gson();
		String irisData = gson.toJson(irisList);
		model.addAttribute("irisData", irisData);

		return "analytics/chart";
	}

	// 데이터 선택 부분 컨트롤러
	@RequestMapping("/analytics/info/{fileId}")
	public String analyticsDatabaseInfo(@PathVariable String fileId, HttpServletRequest req,
			HttpServletResponse response, Model model) throws Exception {

		String[] tmp = fileId.split(",");
		int temp = Integer.parseInt(tmp[0]);
		int test = 0;
		List<Map<String, Object>> rData = new ArrayList<Map<String, Object>>();
		ArrayList<String> fileN = new ArrayList<String>();
		for (int i = 0; i <= temp - 1; i++) {
			test = Integer.parseInt(tmp[i]);
			rData.add(i, analyticsService.analyticsDatabaseInfo(test));
			// info.jsp파일에 파일 제목을 뿌려주기 위한 모델생성.
			UploadFileVO getFile = uploadFileService.getFile(test);
			String fileName = getFile.getFileName();
			fileN.add(i, fileName);

		}
		System.out.println(rData.size());
		model.addAttribute("rData", rData);
		model.addAttribute("fileName", fileN);
		return "analytics/info";

	}

	@RequestMapping("/analytics/summary/{fileId}")
	public String summary(@PathVariable int fileId, Model model) {
		model.addAttribute("rSummary", analyticsService.getSummary(fileId));
		return "analytics/summary";
	}

	// 데이터 전처리 부분 컨트롤러
	@RequestMapping("/analytics/handling/{fileName}")
	public String dataHandling(@PathVariable String fileName, Model model) throws Exception {
		// service에 fileName과 flowNum을 넘겨준다.
		UploadFileVO insert = new UploadFileVO();

		insert.setFlowNum(2);
		insert.setFileName(fileName + ".csv");
		insert.setDirectoryName("/");
		// insert.setFileSize(file.getSize()); // byte 단위로 숫자화 해서 넣기
		insert.setFileSize(1204);
		String filePath = "C:\\Users\\COM\\Desktop\\" + insert.getFileName();

		try {
			BufferedReader bReader = new BufferedReader(new FileReader(filePath));
			String line = "";
			byte[] byteData = null;// Better to specify encoding
			while ((line = bReader.readLine()) != null) {
				try {

					if (line != null) {
						String[] array = line.split(",+");

						String tmp = "";
						for (int i = 0; i < array.length; i++) {
							tmp = tmp + array[i];
							System.out.println(tmp);
						}
						byteData = tmp.getBytes();
					}
					insert.setFileData(byteData);
				} finally {
					if (bReader == null) {
						bReader.close();
					}
				}
			}
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		}

		uploadFileService.insertFile(insert);

		analyticsService.analyticsDatabaseInfo(insert.getFileId());
		return "analytics/handling";
	}

	// 데이터 재구조화 부분 컨트롤러
	@RequestMapping("/analytics/restructuring")
	public String restructuring() {
		return "analytics/restructuring";
	}

	// 시각화 부분 컨트롤러
	@RequestMapping("/analytics/visual")
	public String visual() {
		return "analytics/visual";
	}

	// 머신러닝 부분 컨트롤러
	@RequestMapping("/analytics/ML")
	public String machineLearning() {
		return "analytics/ML";
	}

	// 검정통계량 출력 부분 컨트롤러
	@RequestMapping("/analytics/analysis")
	public String analysis() {
		return "analytics/analysis";
	}

	/*
	 * // 민구 테스트
	 * 
	 * @RequestMapping("/analytics/iris2") public String getCsv(Model model) {
	 * ArrayList<SampleVO> getCsv = analyticsService.getCsvFile(); Gson gson =
	 * new Gson(); String getsiu = gson.toJson(getCsv);
	 * model.addAttribute("getsiu", getsiu);
	 * 
	 * return "analytics/visual"; }
	 */
}

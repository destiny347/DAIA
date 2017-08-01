package kr.kosa.destiny.analytics.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kosa.destiny.analytics.model.IrisVO;
import kr.kosa.destiny.analytics.model.SampleVO;
import kr.kosa.destiny.analytics.service.IAnalyticsService;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;
import com.google.gson.Gson;

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

	@RequestMapping("/analytics/iris2")
	public String getAvgPetalbySpecies2(Model model) {
		ArrayList<SampleVO> irisList = analyticsService.getAvgPetalBySpecies2();
		Gson gson = new Gson();
		String irisData = gson.toJson(irisList);
		model.addAttribute("irisData", irisData);

		return "analytics/chart";
	}

	@RequestMapping("/analytics/database/{fileId}")
	public String analyticsDatabase(@PathVariable int fileId, Model model) {
		ArrayList<SampleVO> irisList = analyticsService.analyticsDatabase(fileId);
		Gson gson = new Gson();
		String irisData = gson.toJson(irisList);
		model.addAttribute("irisData", irisData);

		return "analytics/chart";
	}

	//데이터 선택 부분 컨트롤러
	@RequestMapping("/analytics/info/{fileId}")
	public String analyticsDatabaseInfo(@PathVariable int fileId, HttpServletRequest req, Model model) 
			throws Exception{
		Map<String, Object> rData = analyticsService.analyticsDatabaseInfo(fileId);
		model.addAttribute("rData", rData);

		//info.jsp파일에 파일 제목을 뿌려주기 위한 모델생성.
		UploadFileVO getFile = uploadFileService.getFile(fileId);
		String fileName = getFile.getFileName();
		model.addAttribute("fileName", fileName);


		return "analytics/info";
	}




	@RequestMapping("/analytics/summary/{fileId}")
	public String summary(@PathVariable int fileId, Model model) {
		model.addAttribute("rSummary", analyticsService.getSummary(fileId));
		return "analytics/summary";
	}

	//데이터 전처리 부분 컨트롤러
	@RequestMapping("/analytics/handling")
	public String dataHandling() {
		return "analytics/handling";
	}

	//데이터 재구조화 부분 컨트롤러
	@RequestMapping("/analytics/restructuring")
	public String restructuring() {
		return "analytics/restructuring";
	}

	//시각화 부분 컨트롤러
	@RequestMapping("/analytics/visual")
	public String visual() {
		return "analytics/visual";
	}

	//머신러닝 부분 컨트롤러
	@RequestMapping("/analytics/ML")
	public String machineLearning() {
		return "analytics/ML";
	}

	//검정통계량 출력 부분 컨트롤러
	@RequestMapping("/analytics/analysis")
	public String analysis() {
		return "analytics/analysis";
	}
}


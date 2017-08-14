package kr.kosa.destiny.analytics.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.JsonParseException;


import kr.kosa.destiny.analytics.model.IrisVO;
import kr.kosa.destiny.analytics.model.SampleVO;
import kr.kosa.destiny.analytics.model.SampleVO1;
import kr.kosa.destiny.analytics.service.IAnalyticsService;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;

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

		return "analytics/visual";
	}

	// 
	@RequestMapping("/analytics/iris3")
	public String getAvgPetalbySpecies3(Model model) {
		ArrayList<SampleVO1> irisList = analyticsService.getAvgPetalBySpecies3();
		Gson gson = new Gson();
		String irisData = gson.toJson(irisList);
		model.addAttribute("irisData2", irisData);

		return "analytics/visual";
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
	@RequestMapping(value = "/analytics/info/{fileId}")
	public String analyticsDatabaseInfo(@PathVariable String fileId, HttpServletRequest req, HttpServletResponse response,Model model) 
			throws Exception{

		String[] tmp = fileId.split(",");
		int temp=Integer.parseInt(tmp[0]);
		int test=0;
		List<Map<String, Object>> rData = new ArrayList<Map<String, Object>>();      
		ArrayList<String> fileN = new ArrayList<String>();
		for(int i=0;i <= temp-1 ; i++){         
			test = Integer.parseInt(tmp[i]);      
			rData.add(i ,analyticsService.analyticsDatabaseInfo(test));   
			//info.jsp파일에 파일 제목을 뿌려주기 위한 모델생성.               
			UploadFileVO getFile = uploadFileService.getFile(test);
			String fileName = getFile.getFileName();
			fileN.add(i,fileName);

		}
		model.addAttribute("rData", rData);
		model.addAttribute("fileName", fileN);
		return "analytics/info";

	}

	@RequestMapping("/analytics/summary/{fileId}")
	public String summary(@PathVariable int fileId, Model model) {
		model.addAttribute("rSummary", analyticsService.getSummary(fileId));
		return "analytics/summary";
	}


	public HashMap<String, Object> convertJsonToObject(String json) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		TypeReference<HashMap<String, Object>> typeReference = new TypeReference<HashMap<String, Object>>() { };
		HashMap<String, Object> object = objectMapper.readValue(json, typeReference);
		return object;
	}


	//데이터 재구조화 부분 컨트롤러
	@RequestMapping(value="/analytics/restructuring",method=RequestMethod.GET)
	public String restructuring( Model model) {
		model.addAttribute("fileList",uploadFileService.getAllFileList());

		UploadFileVO getFile = uploadFileService.getFile(8);
		model.addAttribute("fileName", getFile.getFileName());
		Map<String, Object> test = analyticsService.analyticsDatabaseInfo(8);
		model.addAttribute("list", test);
		UploadFileVO dd = uploadFileService.getFile(10);
		model.addAttribute("dd", dd.getFileName());
		Map<String, Object> tmp = analyticsService.analyticsDatabaseInfo(10);
		model.addAttribute("tmp", tmp);
		Map<String, Object> result = analyticsService.analyticsDatabaseInfo(4);
		model.addAttribute("result", result);
		String groupcol = "OCCP_GRP_1";  // 이거 받아서 사용해야함
		String datacol = "CUST_INCM";    // 이거 받아서 사용해야함.. 
		//analyticsService.zeroToMeanByGroup(groupcol,datacol);
		model.addAttribute("groupcol", groupcol);
		model.addAttribute("datacol", datacol);
		return "analytics/restructuring";
	}

	@RequestMapping(value="/analytics/restructuring",method=RequestMethod.POST)
	public String restructuring( Model model,
			@RequestBody String filterJSON){               

		return "analytics/restructuring";

	}

	//시각화 부분 컨트롤러
	@RequestMapping("/analytics/visual")
	public String visual() {
		return "analytics/visual";
	}

	//머신러닝 부분 컨트롤러
	@RequestMapping("/analytics/ML")
	public String machineLearning(Model model) {
		UploadFileVO getFile = uploadFileService.getFile(6);
		model.addAttribute("fileName", getFile.getFileName());
		Map<String, Object> test = analyticsService.analyticsDatabaseInfo(6);
		model.addAttribute("list", test);


		return "analytics/ML";
	}

	//검정통계량 출력 부분 컨트롤러
	@RequestMapping("/analytics/analysis")
	public String analysis() {
		return "analytics/analysis";
	}

	/*
   // 민구 테스트

   @RequestMapping("/analytics/iris2")
   public String getCsv(Model model) {
      ArrayList<SampleVO> getCsv = analyticsService.getCsvFile();
      Gson gson = new Gson();
      String getsiu = gson.toJson(getCsv);
      model.addAttribute("getsiu", getsiu);

      return "analytics/visual";
   }
	 */



}



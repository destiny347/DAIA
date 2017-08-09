package kr.kosa.destiny.analytics.controller;


import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



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
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping("/analytics/info/{fileId}")
	public String analyticsDatabaseInfo(@PathVariable String fileId, Model model) 
			throws Exception{

		String[] tmp = fileId.split(",");
		int temp=Integer.parseInt(tmp[0]);
		int test=0;
		List<Map<String, Object>> rData = new ArrayList<Map<String, Object>>();      
		ArrayList<String> fileN = new ArrayList<String>();
		for(int i=0;i <= temp-1 ; i++){         
			test = Integer.parseInt(tmp[i]);      
			//System.out.println(test);
			rData.add(i ,analyticsService.analyticsDatabaseInfo(test));   
			//info.jsp파일에 파일 제목을 뿌려주기 위한 모델생성.               
			UploadFileVO getFile = uploadFileService.getFile(test);
			String fileName = getFile.getFileName();
			fileN.add(i,fileName);

		}
		//System.out.println(rData.size());
		model.addAttribute("rData", rData);
		model.addAttribute("fileName", fileN);
		return "analytics/info";

	}

	public HashMap<String, Object> convertJsonToObject(String json) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		TypeReference<HashMap<String, Object>> typeReference = new TypeReference<HashMap<String, Object>>() { };
		HashMap<String, Object> object = objectMapper.readValue(json, typeReference);
		return object;
	}

	@RequestMapping(value="/analytics/okModal/{fileName}", method=RequestMethod.GET)
	public String okModal(@PathVariable String fileName,Model model) throws Exception{
		model.addAttribute("name", fileName);
		return "analytics/okModal";		
	}
	
	@RequestMapping(value="/analytics/okModal/{fileName}",method=RequestMethod.POST)
	@ResponseBody
	public String okModal(Model model,
			@RequestBody String filterJSON) throws Exception {
		// service에 fileName과 flowNum을 넘겨준다.
		
		// DB 저장
		UploadFileVO insert = new UploadFileVO();

		Map<String, Object> filter = convertJsonToObject(filterJSON);
		//	Logger.info("==================== [MM-PUR] Parameter='" + filter.toString() + "'");
		//		MaterialMaster mm = new MaterialMaster();
		//	mm.setItemGroupCd(mmService.getItemGroupCdByItemGroupDesc(filter.get("itemGroupDesc").toString()));
		//	List<Map<String, Object>> result = mmService.listByFilter(mm);
		//	message.put("result", "OK");
		//	message.put("message", null);
		//	message.put("data", result);
		//	logger.info("==================== [MM-PUR] Return='" + message.toString() + "'");
		System.out.println(filter.get("dmd").toString());
		System.out.println(filter.get("fileName").toString());

		byte[] b = filter.get("blob").toString().getBytes();
		System.out.println(b);
		insert.setFlowNum(2);
		insert.setFileName(filter.get("fileName").toString());
		System.out.println(filter.get("fileName").toString());
		insert.setDirectoryName("/");
		//insert.setFileSize(file.getSize()); // byte 단위로 숫자화 해서 넣기
		insert.setFileSize(35061326);
		insert.setFileData(b);
		model.addAttribute("name", filter.get("fileName").toString());
		model.addAttribute("id", insert.getFileId());
		uploadFileService.insertFile(insert);	
		return "analytics/okModal";
	}
	

	//데이터 전처리 부분 컨트롤러
		@RequestMapping(value="/analytics/handling/{id}", method=RequestMethod.GET)
		public String dataHandling( @PathVariable int id,Model model) throws Exception{
			Map<String, Object> dd = analyticsService.analyticsDatabaseInfo(id);
			model.addAttribute("list", dd);
			UploadFileVO getFile = uploadFileService.getFile(id);
			String fileName = getFile.getFileName();
			model.addAttribute("fileName", fileName);

			
			return "analytics/handling";		
		}

		@RequestMapping(value="/analytics/handling/{id}",method=RequestMethod.POST)
		@ResponseBody
		public String dataHandling( Model model,
				@RequestBody String filterJSON) throws Exception {		
			// DB 저장
				
			//model.addAttribute("naIndex", analyticsService.getNaIndex(filter.get("param").toString()));		
			//System.out.println(analyticsService.getNaIndex(filter.get("").toString()));

			//Map<String, Object> rData22 = analyticsService.analyticsDatabaseInfo(3);
			//rData.get(2);
			//model.addAttribute("ynTo10", analyticsService.ynTo10());
			///Map<String, Object> rData2 = analyticsService.ynTo10(rData22.get("WEDD_YN").toString());
			//System.out.println(rData2.get("WEDD_YN").toString());
			//	model.addAttribute("getTens",analyticsService.naToNumber("WEDD_YN", 10));
			//System.out.println(analyticsService.naToNumber(("WEDD_YN"), 10));
			//	model.addAttribute("chrToNum", analyticsService.getFirstChrToNum(filter.get("param").toString()));
			//	model.addAttribute("nullToN", analyticsService.nullToN(filter.get("param").toString()));
			//	model.addAttribute("zeroToMean", analyticsService.zeroToMeanByGroup(filter.get("param").toString(), filter.get("param").toString()));
			//	model.addAttribute("colToMean", analyticsService.colToMeanByGroup(filter.get("param").toString(), filter.get("param").toString()));


			return "analytics/handling";
		}

	@RequestMapping("/analytics/summary/{fileId}")
	public String summary(@PathVariable int fileId, Model model) {
		model.addAttribute("rSummary", analyticsService.getSummary(fileId));
		return "analytics/summary";
	}




	//데이터 재구조화 부분 컨트롤러
	@RequestMapping("/analytics/restructuring")
	public  String restructuring() {
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




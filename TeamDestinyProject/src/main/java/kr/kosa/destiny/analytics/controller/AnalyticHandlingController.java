package kr.kosa.destiny.analytics.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.kosa.destiny.analytics.service.IAnalyticsService;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;

/* 
 *  이 클래스는 데이터 전처리를 위한 컨트롤러 클래스입니다.
 *  결측치, 이상치 처리를 위한 컨트롤러 메서드들을 모아놨습니다.
 */

@Controller
public class AnalyticHandlingController {

	@Autowired
	IAnalyticsService analyticsService;

	@Autowired
	IUploadFileService uploadFileService;   

	//데이터 전처리 부분 컨트롤러
	@RequestMapping("/analytics/handling")
	public String dataHandling(Model model) throws Exception{
		UploadFileVO getFile = new UploadFileVO();


		//uploadFileService.updateFile(getFile);
		getFile= uploadFileService.getFile(1);
		String fName = getFile.getFileName();
		Map<String, Object> handling = analyticsService.analyticsDatabaseInfo(1);
		model.addAttribute("list", handling);
		model.addAttribute("fileName", fName);
		return "analytics/handling";      
	}

	//데이터의 Y,N 값을 각각 1,0으로 변환해주는 컨트롤러 코드.
	@RequestMapping("/ynto10")
	@ResponseBody
	public String ynto10(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");

		List<Map<String, String[]>> result = new ArrayList<Map<String, String[]>>();
		result =  analyticsService.ynTo10(chkValue);      

		Gson gson = new Gson();

		return gson.toJson(result);
	}

	//데이터의 null값들을 N으로 치환해주는 컨트롤러 코드.
	@RequestMapping("/nulltoN")
	@ResponseBody
	public String nulltoN(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");

		List<Map<String, String[]>> result = new ArrayList<Map<String, String[]>>();
		result =  analyticsService.nullToN(chkValue);      

		Gson gson = new Gson();

		return gson.toJson(result);
	}

	//데이터의 NA값들을 6으로 변환하는 컨트롤러 코드.
	@RequestMapping("/nato6")
	@ResponseBody
	public String naTo6(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");

		List<Map<String, String[]>> result = new ArrayList<Map<String, String[]>>();
		result =  analyticsService.naTo6(chkValue);      

		Gson gson = new Gson();

		return gson.toJson(result);
	}

	//데이터의 NA값들을 사용자 지정값으로 변환하는 컨트롤러 코드.
	@RequestMapping("/natonum")
	@ResponseBody
	public String naToNum(@RequestBody Map<String, String[]> chkValues,
			@RequestBody Map<String, Integer> number) {
		String[] chkValue = chkValues.get("chkValue");
		int num = number.get("num");
		List<Map<String, String[]>> result = new ArrayList<Map<String, String[]>>();
		result =  analyticsService.naToNumber(chkValue,num);      

		Gson gson = new Gson();

		return gson.toJson(result);
	}

	//데이터 열의 최소값을 출력하는 컨트롤러 코드.
	@RequestMapping("/minNum")
	@ResponseBody
	public String minNum(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");
		Map<String, Integer> result = analyticsService.min(chkValue);      
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	//데이터 열의 최대값을 출력하는 컨트롤러 코드.
	@RequestMapping("/maxNum")
	@ResponseBody
	public String maxNum(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");
		Map<String, Integer> result = analyticsService.min(chkValue);      
		Gson gson = new Gson();
		return gson.toJson(result);
	}

}
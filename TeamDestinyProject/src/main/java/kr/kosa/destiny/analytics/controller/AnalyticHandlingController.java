package kr.kosa.destiny.analytics.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.kosa.destiny.analytics.service.IAnalyticsService;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;

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
		getFile= uploadFileService.getFile(2);
		String fName = getFile.getFileName();
		Map<String, Object> handling = analyticsService.analyticsDatabaseInfo(2);
		model.addAttribute("list", handling);
		model.addAttribute("fileName", fName);
		return "analytics/handling";      
	}

	//전처리 ynto10 컨트롤러
	@RequestMapping("/ynto10")
	public String ynto10(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");
		if(chkValue != null) {
			for(String value : chkValue) {
				//System.out.println(value);
			}
		}
		analyticsService.ynTo10(chkValue);

		return "analytics/handling/ynTo10_ok";
	}

	//nulltoN 컨트롤러
	@RequestMapping("/nulltoN")
	public String nulltoN(@RequestBody Map<String, String[]> chkValues) {

		String[] chkValue = chkValues.get("chkValue");
		if(chkValue != null) {
			for(String value : chkValue) {
				//System.out.println(value);
			}
		}
		analyticsService.nullToN(chkValue);

		return "analytics/handling/nullToN_ok";
	}

	//전처리 naTo6 컨트롤러
	@RequestMapping("/nato6")
	public String naTo6(@RequestBody Map<String, String[]> chkValues) {
		String[] chkValue = chkValues.get("chkValue");
		if(chkValue != null) {
			for(String value : chkValue) {
				//System.out.println(value);
			}
		}
		analyticsService.naTo6(chkValue);

		return "analytics/handling/naTo6_ok";
	}

	//전처리 naToNum 컨트롤러
	@RequestMapping("/natonum")
	public String naToNum(@RequestBody Map<String, String[]> chkValues,
			@RequestBody Map<String, Integer> number) {
		String[] chkValue = chkValues.get("chkValue");
		int naToNum = number.get("naToNumber");
		System.out.println(naToNum);
		if(chkValue != null) {
			for(String value : chkValue) {
				System.out.println(value);
			}
		}
		analyticsService.naToNumber(chkValue, naToNum);

		return "analytics/handling/naToNum_ok";
	}

}

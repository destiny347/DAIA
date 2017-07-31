package com.coderby.myapp.analytics.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coderby.myapp.analytics.model.IrisVO;
import com.coderby.myapp.analytics.model.SampleVO;
import com.coderby.myapp.analytics.service.IAnalyticsService;
import com.coderby.myapp.upload.model.UploadFileVO;
import com.coderby.myapp.upload.service.IUploadFileService;
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

	@RequestMapping("/analytics/info/{fileId}")
	public String analyticsDatabaseInfo(@PathVariable int fileId, HttpServletRequest req, Model model) 
			throws Exception{
		Map<String, Object> rData = analyticsService.analyticsDatabaseInfo(fileId);
		model.addAttribute("rData", rData);

		//info.jsp파일에 파일 제목을 뿌려주기 위한 모델생성.
		UploadFileVO getFile = uploadFileService.getFile(fileId);
		String fileName = getFile.getFileName();
		model.addAttribute("fileName", fileName);

		//열거형 인터페이스 - 체크박스에 체크한 열들을 나열하기 위한 기능
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		Enumeration<String> attr = req.getParameterNames();

		while(attr.hasMoreElements()) {
			String attrName = attr.nextElement(); 
			
			//colnames는 체크박스의 name속성값
			if(attrName.equals("colnames")) {
				String[] arr = req.getParameterValues("colnames");

				for(int i=0; i<arr.length; i++) {
//					System.out.println(arr[i]);
				}
				model.addAttribute("clickChkbox", arr);
			}
		}

		return "analytics/info";
	}

	@RequestMapping("/analytics/summary/{fileId}")
	public String summary(@PathVariable int fileId, Model model) {
		model.addAttribute("rSummary", analyticsService.getSummary(fileId));
		return "analytics/summary";
	}
	
	@RequestMapping("/analytics/ML")
	public String machineLearning() {
		return "analytics/ML";
	}
}

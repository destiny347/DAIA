package kr.kosa.destiny.upload.controller;



import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kosa.destiny.analytics.service.IAnalyticsService;
import kr.kosa.destiny.upload.model.UploadFileVO;
import kr.kosa.destiny.upload.service.IUploadFileService;


@Controller
public class UploadFileController {
	static final Logger logger = Logger.getLogger(UploadFileController.class);

	@Autowired
	IUploadFileService uploadFileService;
	@Autowired
	IAnalyticsService analyticsService;

	//파일 업로드 컨트롤러.
	@RequestMapping(value="/upload/new", method=RequestMethod.GET)
	public String uploadImage(Model model) {
		model.addAttribute("dir", "/");
		return "/upload/form";
	}

	@RequestMapping(value="/upload/new", method=RequestMethod.POST)
	public String uploadImage(@RequestParam(value="dir", required=false, defaultValue="/") String dir, @RequestParam MultipartFile file, RedirectAttributes redirectAttrs) {
		logger.info(file.getOriginalFilename());
		try{
			if(file!=null && !file.isEmpty()) {
				logger.info("/upload : " + file.getOriginalFilename());
				UploadFileVO file2 = new UploadFileVO();
				file2.setDirectoryName(dir);
				file2.setFileName(file.getOriginalFilename());
				file2.setFileSize(file.getSize());
				file2.setFileContentType(file.getContentType());
				file2.setFileData(file.getBytes());
				file2.setFlowNum(1);
				logger.info("/upload : " + file2.toString());

				uploadFileService.uploadFile(file2);
			}
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/upload/list";
	}

	//파일 업로드 리스트 컨트롤러.
	@RequestMapping("/upload/list")
	public String getImageList(Model model) {
		model.addAttribute("fileList", uploadFileService.getAllFileList());
		return "/upload/list";
	}

	//업로드 파일 삭제 컨트롤러
	@RequestMapping("/upload/delete/{fileId}")
	public String deleteFile(@PathVariable int fileId) {
		uploadFileService.deleteFile(fileId);
		return "redirect:/upload/list";
	}
	
}



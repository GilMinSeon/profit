package kr.or.profit.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.profit.service.QnaService;

@Controller
public class QnaController {

//	진행과정
//	QnaService > QnaServiceimpl > QnaMapper > Qna_SQL.xml
//	서비스와 연결 
	@Resource(name = "qnaService")
	private QnaService qnaService;

	/**
	 * 글을 등록한다.
	 * 
	 * @param sampleVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
//	qnaList 화면열리면 qnaList 실행 
	@RequestMapping(value = "qnaList.do")
	public String qnaList(@RequestParam Map<String, Object> map, Model model) throws Exception {
		List<?> suserList = qnaService.selectQnaList();
		model.addAttribute("data", suserList);
		return "qna/qnaList";
	}

	@RequestMapping(value = "qnaDetail.do")
	public String qnaDetail(Locale locale, Model model) {

		return "qna/qnaDetail";
	}

	@RequestMapping(value = "qnaAdd.do")
	public String qnaAdd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		return "qna/qnaAdd";
	}

	

	@RequestMapping(value = "qnaMod.do", method = RequestMethod.GET)
	public String qnaMod(Locale locale, Model model) {

		return "qna/qnaMod";
	}

	@RequestMapping(value = "faqAdd.do", method = RequestMethod.GET)
	public String faqAdd(Locale locale, Model model) {

		return "qna/faqAdd";
	}

	@RequestMapping(value = "faqMod.do", method = RequestMethod.GET)
	public String faqMod(Locale locale, Model model) {

		return "qna/faqMod";
	}

//	파일업로드
	@RequestMapping(value = "test1.do", method = RequestMethod.GET)
	public String test(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("여기1 map" + map);
		System.out.println("여기1 model" + model);
		return "qna/test1";
	}
	@RequestMapping(value = "uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		
		 String fileRoot = "C:\\imge\\"; // 외부경로로 저장을 희망할때.
		 

		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot + "resources/fileupload/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/" + savedFileName); // contextroot +
																								// resources + 저장할 내부
																								// 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}

}

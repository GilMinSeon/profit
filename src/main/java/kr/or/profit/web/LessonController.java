package kr.or.profit.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.or.profit.service.AttachFileService;
import kr.or.profit.service.LessonService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.LessonVO;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class LessonController {
	
	private static final Logger logger = LoggerFactory.getLogger(LessonController.class);
	
	@Resource(name="lessonService")
	private LessonService lessonService;
	
	@Resource(name = "fileService")
	private AttachFileService fileService;
	
	/**
	 * 강의 목록 조회 -나중에 페이징처리하자민정아
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "lessonList", method = RequestMethod.GET)
	public String lessonList(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  { 
		List<?> lessonList = lessonService.selectLessonList();
		model.addAttribute("resultList", lessonList);
		System.out.println("dddddddddddd"+model);
		return "lesson/lessonList";
	}
	
	/**
	 * 강의 상세 조회
	 * @param lessonVO
	 * @param locale
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "lessonDetail", method = RequestMethod.GET)
	public String lessonDetail(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  { 
		List<?> lessonDetailList = lessonService.selectLessonDetail();
		model.addAttribute("resultList", lessonDetailList);
		System.out.println("resultList"+model);
		return "lesson/lessonDetail";
	}
	
	/**
	 * 강의 등록
	 * @param lessonVO - 등록할 정보가 담긴 VO
	 * @param
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "lessonAdd", method = RequestMethod.GET)
	public String lessonAdd(Locale locale, Model model) {
		
		return "lesson/lessonAdd";
	}
	
	@RequestMapping(value = "lesson_ins", method = RequestMethod.POST)
	@ResponseBody
	public String lessonAdd(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  {
//		System.out.println(lessonVO.getLessonTitle());
		System.out.println(fileVO.getFileRealName());
		
		String message = "";
		int cnt = lessonService.insertLesson(lessonVO);
		int cnt1 = fileService.insertLessonFile(fileVO);
		if(cnt == 1 && cnt1 ==1) {
			message = "ok";
		}
		return message;
	}
	
	/**
	 * 강의를 수정한다 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "lessonMod", method = RequestMethod.GET)
	public String lessonMod(Locale locale, Model model) {
		
		return "lesson/lessonMod";
	}
	
//	@RequestMapping(value = "lesson_upd", method = RequestMethod.POST)
//	@ResponseBody
//	public String lessonMod(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  {
//		
//		model = model.addAttribute("data", lessonVO);
//		
//		String message = "";
//		int cnt = lessonService.updateLesson(lessonVO);
//		int cnt1 = fileService.insertLessonFile(fileVO);
//		if(cnt == 1 && cnt1 ==1) {
//			message = "ok";
//		}
//		return message;
//	}
	
	

	@RequestMapping(value = "classDetail", method = RequestMethod.GET)
	public String classDetail(Locale locale, Model model) {
		
		return "lesson/classDetail";
	}
	@RequestMapping(value = "classAdd", method = RequestMethod.GET)
	public String classAdd(Locale locale, Model model) {
		
		return "lesson/classAdd";
	}
	@RequestMapping(value = "classMod", method = RequestMethod.GET)
	public String classMod(Locale locale, Model model) {
		
		return "lesson/classMod";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "lesson/test";
	}
	
}

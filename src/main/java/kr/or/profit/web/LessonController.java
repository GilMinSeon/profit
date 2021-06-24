package kr.or.profit.web;

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

import kr.or.profit.service.LessonService;
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
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "lessonList", method = RequestMethod.GET)
	public String lessonList(Locale locale, Model model) {
		
		return "lesson/lessonList";
	}
	
	@RequestMapping(value = "lessonDetail", method = RequestMethod.GET)
	public String lessonDetail(Locale locale, Model model) {
		
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
	public String lessonAdd(@ModelAttribute("lessonVO") LessonVO lessonVO, Model model) throws Exception  {
		System.out.println("강의등록 체크");
		String message = "";
		int cnt = lessonService.insertLesson(lessonVO);
		if(cnt == 1) {
			message = "ok";
		}
		return message;
	}
	
	@RequestMapping(value = "lessonMod", method = RequestMethod.GET)
	public String lessonMod(Locale locale, Model model) {
		
		return "lesson/lessonMod";
	}

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

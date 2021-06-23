package kr.or.profit.web;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class LessonController {
	
	private static final Logger logger = LoggerFactory.getLogger(LessonController.class);
	
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
	
	@RequestMapping(value = "lessonAdd", method = RequestMethod.GET)
	public String lessonAdd(Locale locale, Model model) {
		
		return "lesson/lessonAdd";
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

package kr.or.profit.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminLessonController {

	
	@RequestMapping(value = "adminLessonList.do", method = RequestMethod.GET)
	public String adminLessonList(Locale locale, Model model) {

		return "adminLesson/adminLessonList";
	}
	
}
package kr.or.profit.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.profit.service.AdminChatService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;

@Controller
public class TrainerController {
//	@Resource(name = "adminChatService")
//	private AdminChatService adminChatService;
	
	
	
	@RequestMapping(value = "teachList.do", method = RequestMethod.GET)
	public String teachList(Locale locale, Model model) {

		return "trainerPage/teachList";
	}
	
	@RequestMapping(value = "myTrainerInfo.do", method = RequestMethod.GET)
	public String myTrainerInfo(Locale locale, Model model) {

		return "trainerPage/myTrainerInfo";
	}
	
	@RequestMapping(value = "myLessonSum.do", method = RequestMethod.GET)
	public String myLessonSum(Locale locale, Model model) {

		return "trainerPage/myLessonSum";
	}
	
	
}
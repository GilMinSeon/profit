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
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "trainerPermitList", method = RequestMethod.GET)
	public String fitness(Locale locale, Model model) {

		return "admin/trainerPermitList";
	}
	@RequestMapping(value = "trainerPermitDetail", method = RequestMethod.GET)
	public String trainerPermitDetail(Locale locale, Model model) {

		return "admin/trainerPermitDetail";
	}
	@RequestMapping(value = "adminMemberList", method = RequestMethod.GET)
	public String adminMemberList(Locale locale, Model model) {

		return "admin/adminMemberList";
	}
	@RequestMapping(value = "adminMemberDetail", method = RequestMethod.GET)
	public String adminMemberDetail(Locale locale, Model model) {

		return "admin/adminMemberDetail";
	}
	
	@RequestMapping(value = "adminLessonList", method = RequestMethod.GET)
	public String adminLessonList(Locale locale, Model model) {

		return "admin/adminLessonList";
	}
	
	@RequestMapping(value = "adminSendMail", method = RequestMethod.GET)
	public String adminSendMail(Locale locale, Model model) {

		return "admin/adminSendMail";
	}

	@RequestMapping(value = "adminChatList", method = RequestMethod.GET)
	public String adminChatList(Locale locale, Model model) {

		return "admin/adminChatList";
	}
	
	@RequestMapping(value = "adminChatDetail", method = RequestMethod.GET)
	public String adminChatDetail(Locale locale, Model model) {

		return "admin/adminChatDetail";
	}
	
	@RequestMapping(value = "adminTicketPayList", method = RequestMethod.GET)
	public String adminTicketPayList(Locale locale, Model model) {

		return "admin/adminTicketPayList";
	}
}
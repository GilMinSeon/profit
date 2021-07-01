package kr.or.profit.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminMemberController {


	@RequestMapping(value = "trainerPermitList.do", method = RequestMethod.GET)
	public String fitness(Locale locale, Model model) {

		return "adminMember/trainerPermitList";
	}
	@RequestMapping(value = "trainerPermitDetail.do", method = RequestMethod.GET)
	public String trainerPermitDetail(Locale locale, Model model) {

		return "adminMember/trainerPermitDetail";
	}
	
	
	
	
	@RequestMapping(value = "adminMemberList.do", method = RequestMethod.GET)
	public String adminMemberList(Locale locale, Model model) {

		return "adminMember/adminMemberList";
	}
	@RequestMapping(value = "adminMemberDetail.do", method = RequestMethod.GET)
	public String adminMemberDetail(Locale locale, Model model) {

		return "adminMember/adminMemberDetail";
	}
	
	@RequestMapping(value = "adminSendMail.do", method = RequestMethod.GET)
	public String adminSendMail(Locale locale, Model model) {

		return "adminMember/adminSendMail";
	}
}
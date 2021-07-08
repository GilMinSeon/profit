package kr.or.profit.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminChatController {

	@RequestMapping(value = "adminChatList.do", method = RequestMethod.GET)
	public String adminChatList(Locale locale, Model model) {

		return "adminChat/adminChatList";
	}
	
	@RequestMapping(value = "adminChatDetail.do", method = RequestMethod.GET)
	public String adminChatDetail(Locale locale, Model model) {

		return "adminChat/adminChatDetail";
	}
	
	@RequestMapping(value = "adminTicketPayList.do", method = RequestMethod.GET)
	public String adminTicketPayList(Locale locale, Model model) {

		return "adminChat/adminTicketPayList";
	}
}
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
public class DietController {
	
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "chatList", method = RequestMethod.GET)
	public String chatList(Locale locale, Model model) {
		return "diet/chatList";
	}

	@RequestMapping(value = "chatDetail", method = RequestMethod.GET)
	public String chatDetail(Locale locale, Model model) {
		return "diet/chatDetail";
	}
	
	@RequestMapping(value = "buyTicket", method = RequestMethod.GET)
	public String buyTicket(Locale locale, Model model) {
		return "diet/buyTicket";
	}
	
	@RequestMapping(value = "buyTicketDetail", method = RequestMethod.GET)
	public String buyTicketDetail(Locale locale, Model model) {
		return "diet/buyTicketDetail";
	}
	
	@RequestMapping(value = "chatting", method = RequestMethod.GET)
	public String chatting(Locale locale, Model model) {
		return "diet/chatting";
	}
	
	


	
}

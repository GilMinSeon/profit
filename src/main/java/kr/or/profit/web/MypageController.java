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
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfo(Locale locale, Model model) {
		
		return "mypage/myinfo";
	}
	
	@RequestMapping(value = "bookmark", method = RequestMethod.GET)
	public String bookmark(Locale locale, Model model) {
		
		return "mypage/bookmark";
	}
	
	@RequestMapping(value = "trainerApply", method = RequestMethod.GET)
	public String trainerApply(Locale locale, Model model) {
		
		return "mypage/trainerApply";
	}
	
	@RequestMapping(value = "trainerInfo", method = RequestMethod.GET)
	public String trainerInfo(Locale locale, Model model) {
		
		return "mypage/trainerInfo";
	}
	
	@RequestMapping(value = "listenList", method = RequestMethod.GET)
	public String listenList(Locale locale, Model model) {
		
		return "mypage/listenList";
	}
	
	@RequestMapping(value = "teachList", method = RequestMethod.GET)
	public String teachList(Locale locale, Model model) {
		
		return "mypage/teachList";
	}
	
	@RequestMapping(value = "pwdMod", method = RequestMethod.GET)
	public String pwdMod(Locale locale, Model model) {
		
		return "mypage/pwdMod";
	}
	
	@RequestMapping(value = "mobileMod", method = RequestMethod.GET)
	public String mobileMod(Locale locale, Model model) {
		
		return "mypage/mobileMod";
	}

	@RequestMapping(value = "payDetail", method = RequestMethod.GET)
	public String payDetail(Locale locale, Model model) {
		
		return "mypage/payDetail";
	}
	
	@RequestMapping(value = "ticketPayList", method = RequestMethod.GET)
	public String ticketPayList(Locale locale, Model model) {
		
		return "mypage/ticketPayList";
	}
	
	@RequestMapping(value = "ticketPayDetail", method = RequestMethod.GET)
	public String ticketPayDetail(Locale locale, Model model) {
		
		return "mypage/ticketPayDetail";
	}
	
	@RequestMapping(value = "myChatList", method = RequestMethod.GET)
	public String myChatList(Locale locale, Model model) {
		
		return "mypage/myChatList";
	}
	
	@RequestMapping(value = "myChatDetail", method = RequestMethod.GET)
	public String myChatDetail(Locale locale, Model model) {
		
		return "mypage/myChatDetail";
	}
	
}

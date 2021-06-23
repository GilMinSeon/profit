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
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public String noticeList(Locale locale, Model model) {
		
		return "notice/noticeList";
	}
	
	@RequestMapping(value = "noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Locale locale, Model model) {
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value = "noticeAdd", method = RequestMethod.GET)
	public String noticeAdd(Locale locale, Model model) {
		
		return "notice/noticeAdd";
	}
	
	@RequestMapping(value = "noticeMod", method = RequestMethod.GET)
	public String noticeMod(Locale locale, Model model) {
		
		return "notice/noticeMod";
	}
	

	
}

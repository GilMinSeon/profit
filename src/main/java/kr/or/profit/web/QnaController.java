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
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public String qnaList(Locale locale, Model model) {
		
		return "qna/qnaList";
	}
	
	@RequestMapping(value = "qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(Locale locale, Model model) {
		
		return "qna/qnaDetail";
	}
	
	@RequestMapping(value = "qnaAdd", method = RequestMethod.GET)
	public String qnaAdd(Locale locale, Model model) {
		
		return "qna/qnaAdd";
	}
	
	@RequestMapping(value = "qnaMod", method = RequestMethod.GET)
	public String qnaMod(Locale locale, Model model) {
		
		return "qna/qnaMod";
	}
	
	@RequestMapping(value = "faqAdd", method = RequestMethod.GET)
	public String faqAdd(Locale locale, Model model) {
		
		return "qna/faqAdd";
	}
	
	@RequestMapping(value = "faqMod", method = RequestMethod.GET)
	public String faqMod(Locale locale, Model model) {
		
		return "qna/faqMod";
	}
		
}

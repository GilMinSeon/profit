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
public class LessionController {
	
	private static final Logger logger = LoggerFactory.getLogger(LessionController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "lessionList", method = RequestMethod.GET)
	public String lessionList(Locale locale, Model model) {
		
		return "lession/lessionList";
	}
	
	@RequestMapping(value = "lessionDetail", method = RequestMethod.GET)
	public String lessionDetail(Locale locale, Model model) {
		
		return "lession/lessionDetail";
	}
	
	@RequestMapping(value = "lessionAdd", method = RequestMethod.GET)
	public String lessionAdd(Locale locale, Model model) {
		
		return "lession/lessionAdd";
	}
	
	@RequestMapping(value = "lessionMod", method = RequestMethod.GET)
	public String lessionMod(Locale locale, Model model) {
		
		return "lession/lessionMod";
	}

	@RequestMapping(value = "classDetail", method = RequestMethod.GET)
	public String classDetail(Locale locale, Model model) {
		
		return "lession/classDetail";
	}
	@RequestMapping(value = "classAdd", method = RequestMethod.GET)
	public String classAdd(Locale locale, Model model) {
		
		return "lession/classAdd";
	}
	@RequestMapping(value = "classMod", method = RequestMethod.GET)
	public String classMod(Locale locale, Model model) {
		
		return "lession/classMod";
	}

	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "lession/test";
	}
	
}

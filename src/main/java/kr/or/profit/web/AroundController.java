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
public class AroundController {
	
	private static final Logger logger = LoggerFactory.getLogger(AroundController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "fitness", method = RequestMethod.GET)
	public String fitness(Locale locale, Model model) {
		
		return "around/fitness";
	}
	
	@RequestMapping(value = "walk", method = RequestMethod.GET)
	public String walk(Locale locale, Model model) {
		
		return "around/walk";
	}
	
	@RequestMapping(value = "hiking", method = RequestMethod.GET)
	public String hiking(Locale locale, Model model) {
		
		return "around/hiking";
	}
}

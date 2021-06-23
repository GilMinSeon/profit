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
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "eventList", method = RequestMethod.GET)
	public String eventList(Locale locale, Model model) {
		return "event/eventList";
	}
	
	@RequestMapping(value = "eventDetail", method = RequestMethod.GET)
	public String eventDetail(Locale locale, Model model) {
		
		return "event/eventDetail";
	}
	
	@RequestMapping(value = "eventAdd", method = RequestMethod.GET)
	public String eventAdd(Locale locale, Model model) {
		
		return "event/eventAdd";
	}
	

	
}

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
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "recipeList", method = RequestMethod.GET)
	public String recipeList(Locale locale, Model model) {
		
		return "community/recipeList";
	}
	
	@RequestMapping(value = "recipeDetail", method = RequestMethod.GET)
	public String recipeDetail(Locale locale, Model model) {
		
		return "community/recipeDetail";
	}
	
	@RequestMapping(value = "recipeAdd", method = RequestMethod.GET)
	public String recipeAdd(Locale locale, Model model) {
		
		return "community/recipeAdd";
	}
	
	@RequestMapping(value = "recipeMod", method = RequestMethod.GET)
	public String recipeMod(Locale locale, Model model) {
		
		return "community/recipeMod";
	}
	
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model) {
		
		return "community/boardList";
	}
	
	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public String boardDetail(Locale locale, Model model) {
		
		return "community/boardDetail";
	}
	
	@RequestMapping(value = "boardAdd", method = RequestMethod.GET)
	public String boardAdd(Locale locale, Model model) {
		
		return "community/boardAdd";
	}
	
	@RequestMapping(value = "boardMod", method = RequestMethod.GET)
	public String boardMod(Locale locale, Model model) {
		
		return "community/boardMod";
	}

	
}

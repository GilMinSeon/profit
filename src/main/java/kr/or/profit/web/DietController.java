package kr.or.profit.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.DietService;
import kr.or.profit.vo.ReplyVO;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class DietController {
	@Resource(name = "dietService")
	private DietService dietService;
	
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
	
	/**
    * 이용권 구매 목록 페이지 
    * @author 정예진
    * @param model
    * @return String - community/boardAdd
    * @throws Exception
    */
	@RequestMapping(value = "buyTicket.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyTicket(Model model) throws Exception{
		return "diet/buyTicket";
	}
	
	@RequestMapping(value = "buyTicketDetail.do", method = RequestMethod.GET)
	public String buyTicketDetail(@RequestParam String ticketCategorySeq, HttpServletRequest request,  Model model) throws Exception{
		
		Map<String, Object> ticketCategory = dietService.selectTicketCategory(ticketCategorySeq);
		model.addAttribute("ticketCategory" , ticketCategory);
		
		return "diet/buyTicketDetail";
	}
	
	@RequestMapping(value = "chatting", method = RequestMethod.GET)
	public String chatting(Locale locale, Model model) {
		return "diet/chatting";
	}
	
	@RequestMapping(value = "return.do", method = RequestMethod.POST)
	public String return11(Locale locale, Model model) {
		return "diet/return";
	}
	
	@RequestMapping(value = "close.do", method = RequestMethod.POST)
	public String close(Locale locale, Model model) {
		return "diet/close";
	}
	
	
	
	


	
}

package kr.or.profit.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.DietService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.ChatProfileVO;
//import kr.or.profit.vo.ChatProfileVO;
import kr.or.profit.vo.ReplyVO;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class DietController {
	@Resource(name = "dietService")
	private DietService dietService;
	
	MypageController mc = new MypageController();
	
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "chatList.do", method = RequestMethod.GET)
	public String chatList(HttpServletRequest request , Model model) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if(memberId == null) {
			return "member/loginForm";
		}
		//이용권이 존재하면 구매 못하도록 막기
		int ticketFlag = dietService.selectAvailableTicket(memberId);
		if(ticketFlag > 0) {
			model.addAttribute("msg", "ng");
		}else {
			model.addAttribute("msg", "ok");
		}
		
		//트레이너가 프로필 등록이 되어있으면 등록을 못하도록 막기
		int profileFlag = dietService.selectRegisterProfile(memberId);
		
		if(profileFlag > 0) {
			model.addAttribute("profileFlag", "ng");
		}else {
			model.addAttribute("profileFlag", "ok");
		}
		
		//상담 프로필 목록 가져오기
		List<Map<String, Object>> chatList = dietService.selectChatProflieList();
		
		model.addAttribute("chatList", chatList);
		
		System.out.println(model.toString());
		
		return "diet/chatList";
	}
	
	@RequestMapping(value = "chatProfileAdd.do", method = RequestMethod.GET)
	public String chatProfileAdd(Locale locale, Model model) {
		return "diet/chatProfileAdd";
	}

	@RequestMapping(value = "chatDetail.do", method = RequestMethod.GET)
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
	public String buyTicket(Model model, HttpServletRequest request) throws Exception{
		
		
		return "diet/buyTicket";
	}
	
	@RequestMapping(value = "buyTicketDetail.do", method = RequestMethod.GET)
	public String buyTicketDetail(@RequestParam String ticketCategorySeq, HttpServletRequest request,  Model model) throws Exception{
		
		Map<String, Object> ticketCategory = dietService.selectTicketCategory(ticketCategorySeq);
		model.addAttribute("ticketCategory" , ticketCategory);
		System.out.println(model.toString());
		
		return "diet/buyTicketDetail";
	}
	
	
	@RequestMapping(value = "ticketAddAjax.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String ticketAddAjax(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		String ticketCategorySeq = request.getParameter("ticketCategorySeq");
		String ticketName = request.getParameter("ticketName");
		String ticketPrice = request.getParameter("ticketPrice");
		String ticketCnt = request.getParameter("ticketCnt");
		
		System.out.println("ticketCategorySeq : " + ticketCategorySeq);
		System.out.println("ticketName : " + ticketName );
		System.out.println("ticketPrice : " + ticketPrice );
		System.out.println("ticketCnt : " + ticketCnt );
		
		BuyTicketVO buyTicketvo = new BuyTicketVO();
		buyTicketvo.setTicketCategorySeq(ticketCategorySeq);
		buyTicketvo.setTicketRemain(ticketCnt);
		buyTicketvo.setInUserId(memberId);
		buyTicketvo.setUpUserId(memberId);
		
		int insertResult = dietService.insertBuyTicket(buyTicketvo);

	    String msg="ng";
	    
		if(insertResult > 0) {
			msg = "ok";
		}
		
		return msg;
	}
	
	
		
	@RequestMapping(value = "chatProfileAddAjax.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String chatProfileAddAjax(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multipartRequest) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		//파일업로드
		List<AttachFileVO> fileVOList = mc.fileProcess(multipartRequest, request);
		
		
		// 파일 DB 저장
		Map<String, Object> filemap = new HashMap<String, Object>();
		filemap.put("list", fileVOList);
		System.out.println("왜안돼");
		System.out.println(fileVOList.get(0).getFileDetailSeq());
		System.out.println(fileVOList.get(0).getFilePath());
		System.out.println(fileVOList.get(0).getFileRealName());
		System.out.println(fileVOList.get(0).getFileSaveName());
		System.out.println(fileVOList.get(0).getInUserId());
		int insertFileResult = dietService.insertProcessFile(filemap);
		System.out.println("insertFileResult : " + insertFileResult);
		
		
		String simpleIntro = request.getParameter("simpleIntro");
		String profileMemo = request.getParameter("profileMemo");
		
		ChatProfileVO chatProfileVo = new ChatProfileVO();
		chatProfileVo.setFileSeq(fileVOList.get(0).getFileSeq());
		chatProfileVo.setChatProfileId(memberId);
		chatProfileVo.setChatProfileIntro(simpleIntro);
		chatProfileVo.setChatProfileMemo(profileMemo);
		chatProfileVo.setInUserId(memberId);
		chatProfileVo.setUpUserId(memberId);
		
		System.out.println("============================");
		System.out.println(chatProfileVo.getFileSeq());
		System.out.println(chatProfileVo.getChatProfileIntro());
		System.out.println(chatProfileVo.getChatProfileMemo());
		int insertResult = dietService.insertChatProfile(chatProfileVo);
		
	    String msg="ng";
	    
		if(insertResult > 0) {
			msg = "ok";
		}
		
		return msg;
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

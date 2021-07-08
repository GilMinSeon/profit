package kr.or.profit.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.profit.service.AdminChatService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;

@Controller
public class AdminChatController {
	@Resource(name = "adminChatService")
	private AdminChatService adminChatService;
	
	@RequestMapping(value = "adminChatList.do",  method = { RequestMethod.GET, RequestMethod.POST })
	public String adminChatList(Model model, HttpServletRequest request, Criteria cri,
			@RequestParam(value = "selStatus", required = false) String selStatus,
			@RequestParam(value = "selIdentity", required = false) String selIdentity,
			@RequestParam(value = "selDate", required = false) String selDate,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws Exception{
			
		System.out.println("selStatus : " + selStatus);
		System.out.println("selIdentity : " + selIdentity);
		System.out.println("selDate : " + selDate);
		System.out.println("searchKeyword : " + searchKeyword);
		
		cri.setPerPageNum(10);
		cri.setSelStatus(selStatus);
		cri.setSelIdentity(selIdentity);
		cri.setSelDate(selDate);
		cri.setSearchKeyword(searchKeyword);
		
		//이용권 구매 목록 조회
		List<Map<String, Object>> chatList = adminChatService.selectAdminChatList(cri);
		
		model.addAttribute("chatList", chatList);
		System.out.println(model.toString());
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("====");
		System.out.println(adminChatService.selectAdminChatCnt(cri));
		//전체 글 개수 세팅
		pageMaker.setTotalCount(adminChatService.selectAdminChatCnt(cri));
		
		System.out.println(adminChatService.selectAdminChatCnt(cri) + "가져오는 개수!");
		model.addAttribute("pageMaker", pageMaker);
		
		//입력한 검색어 유지시키기
		model.addAttribute("selStatus", selStatus);
		model.addAttribute("selIdentity", selIdentity);
		model.addAttribute("selDate", selDate);
		model.addAttribute("searchKeyword", searchKeyword);
		
		System.out.println("최종 모델");
		System.out.println(model);
		
		return "adminChat/adminChatList";
	}
	
	@RequestMapping(value = "adminChatDetail.do", method = RequestMethod.GET)
	public String adminChatDetail(Locale locale, Model model) {

		return "adminChat/adminChatDetail";
	}
	
	@RequestMapping(value = "adminTicketPayList.do", method = RequestMethod.GET)
	public String adminTicketPayList(Locale locale, Model model) {

		return "adminChat/adminTicketPayList";
	}
}
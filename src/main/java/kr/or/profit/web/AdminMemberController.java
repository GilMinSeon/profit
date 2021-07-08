package kr.or.profit.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.profit.service.AdminMemberService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;
import kr.or.profit.vo.ProcessVO;

@Controller
public class AdminMemberController {
	
	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;
	
	
	//트레이너 승인 리스트
	@RequestMapping(value = "trainerPermitList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fitness(Model model, HttpServletRequest request, Criteria cri,
			@RequestParam(value = "selStatus", required = false) String selStatus,
			@RequestParam(value = "selIdentity", required = false) String selIdentity,
			@RequestParam(value = "selDate", required = false) String selDate,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws Exception{
		
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}
		
		cri.setSelStatus(selStatus);
		cri.setSelIdentity(selIdentity);
		cri.setSelDate(selDate);
		cri.setSearchKeyword(searchKeyword);
		cri.setPerPageNum(10);
		
		ProcessVO todayNumberList = adminMemberService.selectProcessNumberList();
		model.addAttribute("todayNumberList", todayNumberList);
		
		List<Map<String, Object>> processList = adminMemberService.selectProcessList(cri);
		model.addAttribute("processList", processList);
		
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(adminMemberService.selectProcessListCnt(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("selStatus", selStatus);
		model.addAttribute("selIdentity", selIdentity);
		model.addAttribute("selDate", selDate);
		model.addAttribute("searchKeyword", searchKeyword);
		
		
		System.out.println(todayNumberList.toString());
		System.out.println(processList.toString());
		
		return "adminMember/trainerPermitList";
	}
	
	
	
	@RequestMapping(value = "trainerPermitDetail.do", method = RequestMethod.GET)
	public String trainerPermitDetail(Locale locale, Model model) {

		return "adminMember/trainerPermitDetail";
	}
	
	@RequestMapping(value = "adminMemberList.do", method = RequestMethod.GET)
	public String adminMemberList(Locale locale, Model model) {

		return "adminMember/adminMemberList";
	}
	@RequestMapping(value = "adminMemberDetail.do", method = RequestMethod.GET)
	public String adminMemberDetail(Locale locale, Model model) {

		return "adminMember/adminMemberDetail";
	}
	
	@RequestMapping(value = "adminSendMail.do", method = RequestMethod.GET)
	public String adminSendMail(Locale locale, Model model) {

		return "adminMember/adminSendMail";
	}
}
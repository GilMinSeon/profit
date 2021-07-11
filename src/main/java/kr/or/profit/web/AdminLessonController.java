package kr.or.profit.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.profit.service.AdminLessonService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;

@Controller
public class AdminLessonController {
	@Resource(name="adminLessonService")
	private AdminLessonService adminLessonService;
	
	@RequestMapping(value = "adminLessonList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminLessonList(Locale locale, Model model, Criteria cri, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		System.out.println("memberId : " + memberId);
		if (memberId == null) {
			memberId = "";
		}
		
		cri.setPerPageNum(10);
		
		//관리자가보는 온라인클래스 리스트
		List<?> adminLessonList = adminLessonService.selectAdminLessonList(cri);
		System.out.println("adminLessonList " + adminLessonList);
		model.addAttribute("adminLessonList", adminLessonList);
		System.out.println("resultModel " + model.toString());
		
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("뭔데");
		System.out.println(pageMaker.getCri().getPage());
		System.out.println(pageMaker.getCri().getPageStart());
		System.out.println(pageMaker.getCri().getPerPageNum());
		
		//전체 글 개수 세팅
		pageMaker.setTotalCount(adminLessonService.selectAdminLessonCnt(cri));
		System.out.println(adminLessonService.selectAdminLessonCnt(cri) + "가져오는 개수!");
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		
		
		return "adminLesson/adminLessonList";
	}
	
	@RequestMapping(value = "adminLessonPayList.do", method = RequestMethod.GET)
	public String adminLessonPayList(Locale locale, Model model) {

		return "adminLesson/adminLessonPayList";
	}
	
}
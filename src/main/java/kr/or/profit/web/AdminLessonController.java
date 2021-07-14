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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.profit.service.AdminLessonService;
import kr.or.profit.vo.BuyLessonVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonVO;
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
	
	
	/**
	 * 관리자 강의 활성화 업데이트
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
   @RequestMapping(value = "updAdminLessonAjax.do")
   @ResponseBody
   public String updAdminLesson(HttpServletRequest request, Model model) throws Exception {
	   HttpSession session = request.getSession();
	   String memberId = (String) session.getAttribute("memberId");
	   System.out.println("memberId업데이트하게나와랏 " + memberId);
	   if (memberId == null) {
		   memberId = "";
	   }
	   
      String lessonSeq = request.getParameter("lessonSeq");
      System.out.println("lessonSeq가져오삼= " + lessonSeq);
      
//      List<?> selectBuyLesson = adminLessonService.selectList(lessonSeq);
//      model.addAttribute("selectBuyLesson", selectBuyLesson);
//      System.out.println("모델 "+ model.toString());
//      String lessonRefundFlag = request.getParameter("lessonRefundFlag");
//      System.out.println("lessonRefundFlag : " +lessonRefundFlag);
      
      //관리자비활성화 시 구매테이블 refund_flag 업데이트
      BuyLessonVO buyvo = new BuyLessonVO();
      buyvo.setMemberId(memberId);
      buyvo.setLessonSeq(lessonSeq);
      int cnt1 = adminLessonService.updAdminRefund(buyvo);
      
      //관리자비활성화 시 강의 테이블 private_flag 업데이트
      String lessonPrivateFlag = request.getParameter("lessonPrivateFlag");
      System.out.println("lessonPrivateFlag가져오삼 " + lessonPrivateFlag);
      
      if(("N").equals(lessonPrivateFlag)) {
    	  lessonPrivateFlag = "Y";
      }else {
    	  lessonPrivateFlag = "N";
      }
      System.out.println("바뀐lessonPrivateFlag " + lessonPrivateFlag);
      
      LessonVO vo = new LessonVO();
      vo.setMemberId(memberId);
      vo.setLessonSeq(lessonSeq);
      vo.setLessonPrivateFlag(lessonPrivateFlag);
      System.out.println("여기1");
      
	  int cnt = adminLessonService.updAdminLesson(vo);
	  System.out.println("여기2");
      String msg = "ng";
      
      if(cnt > 0 && cnt1>0) {
         msg = "ok";
      }
      System.out.println("얌마"+msg);
       return msg;
   }

   /**
    * 민정
    * 관리자 강의 결제 환불내역
    * @param request
    * @param cri
    * @param locale
    * @param model
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "adminLessonPayList.do", method = RequestMethod.GET)
	public String adminLessonPayList(HttpServletRequest request, Criteria cri, Locale locale, Model model) throws Exception {

	   HttpSession session = request.getSession();
	   String memberId = (String) session.getAttribute("memberId");
	   System.out.println("memberId는뭥미? " + memberId);
	   if (memberId == null) {
		   memberId = "";
	   }
	   
	   cri.setPerPageNum(10);
	   
	 //관리자가보는 온라인클래스 결제/환불 리스트
		List<?> adminLessonPayList = adminLessonService.adminLessonPayList(cri);
		System.out.println("adminLessonPayList " + adminLessonPayList);
		model.addAttribute("adminLessonPayList", adminLessonPayList);
		System.out.println("adminLessonPayList " + model.toString());
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("뭔데");
		System.out.println(pageMaker.getCri().getPage());
		System.out.println(pageMaker.getCri().getPageStart());
		System.out.println(pageMaker.getCri().getPerPageNum());
		
		//전체 글 개수 세팅
		pageMaker.setTotalCount(adminLessonService.adminLessonPayListCnt(cri));
		System.out.println(adminLessonService.adminLessonPayListCnt(cri) + "가져오는 개수뭐니?!");
		
		model.addAttribute("pageMaker", pageMaker);
	   
		return "adminLesson/adminLessonPayList";
	}	
	
   
   @RequestMapping(value = "adminLessonStat.do", method = RequestMethod.GET)
	public String adminLessonStat(Locale locale, Model model) {

		return "adminLesson/adminLessonStat";
	}
   
	
}
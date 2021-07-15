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

import kr.or.profit.service.AdminSalesService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;

@Controller
public class AdminSalesController {
	@Resource(name = "adminSalesService")
	private  AdminSalesService adminSalesService;
	
	@RequestMapping(value = "adminSalesList.do", method = RequestMethod.GET)
	public String adminSalesList(Locale locale, Model model, Criteria cri, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		System.out.println("memberId : " + memberId);
		if (memberId == null) {
			memberId = "";
		}
		
		cri.setPerPageNum(10);
		
		//관리자가보는 정산하기 리스트
		List<?> adminSalesList = adminSalesService.selectAdminSales(cri);
		System.out.println("adminSalesList " + adminSalesList);
		model.addAttribute("adminSalesList", adminSalesList);
		System.out.println("resultModel " + model.toString());
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("뭔데");
		System.out.println(pageMaker.getCri().getPage());
		System.out.println(pageMaker.getCri().getPageStart());
		System.out.println(pageMaker.getCri().getPerPageNum());
		
		//전체 글 개수 세팅
		pageMaker.setTotalCount(adminSalesService.selectAdminSalesCnt(cri));
		System.out.println(adminSalesService.selectAdminSalesCnt(cri) + "가져오는 개수!");
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "adminSales/adminSalesList";
	}
	
	@RequestMapping(value = "adminSalesDetail.do", method = RequestMethod.GET)
	public String adminSalesDetail(Locale locale, Model model, Criteria cri, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		System.out.println("memberId : " + memberId);
		if (memberId == null) {
			memberId = "";
		}
		
		String yyyymm = request.getParameter("yyyymm");
		System.out.println("yyyymm뭐 " + yyyymm);
		String gubun = request.getParameter("gubun");
		System.out.println("gubun뭐 " + gubun);
		
		cri.setPerPageNum(10);
		cri.setYyyymm(yyyymm);
		cri.setGubun(gubun);
		
		//관리자가보는 정산하기 상세 리스트
		List<?> adminSalesDetailList = adminSalesService.selectAdminSalesDetail(cri);
		System.out.println("adminSalesDetailList " + adminSalesDetailList);
		model.addAttribute("adminSalesDetailList", adminSalesDetailList);
		System.out.println("resultModel " + model.toString());
		
		//페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("뭔데");
		System.out.println(pageMaker.getCri().getPage());
		System.out.println(pageMaker.getCri().getPageStart());
		System.out.println(pageMaker.getCri().getPerPageNum());
		
		//정산하기 상세 리스트 전체 글 개수 세팅
		pageMaker.setTotalCount(adminSalesService.selectAdminSalesDetailCnt(cri));
		System.out.println(adminSalesService.selectAdminSalesDetailCnt(cri) + "가져오는 개수!");
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "adminSales/adminSalesDetail";
	}
	

}
package kr.or.profit.web;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.stringtemplate.v4.compiler.CodeGenerator.list_return;

//import com.itextpdf.text.Document;
//import com.itextpdf.text.PageSize;
//import com.itextpdf.text.pdf.PdfWriter;
//import com.itextpdf.tool.xml.XMLWorker;
//import com.itextpdf.tool.xml.XMLWorkerFontProvider;
//import com.itextpdf.tool.xml.XMLWorkerHelper;
//import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
//import com.itextpdf.tool.xml.html.CssAppliersImpl;
//import com.itextpdf.tool.xml.html.Tags;
//import com.itextpdf.tool.xml.parser.XMLParser;
//import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
//import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
//import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
//import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.profit.service.TrainerPageService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonVO;
import kr.or.profit.vo.PageMaker;

@Controller
public class TrainerController {
	@Resource(name = "trainerPageService")
	private TrainerPageService trainerPageService;
	
	
	
	@RequestMapping(value = "chatAccountInfo.do", method = RequestMethod.GET)
	public String chatAccountInfo(HttpServletRequest request, Model model, Criteria cri,
			@RequestParam(value = "selDate", required = false) String selDate) throws Exception{
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}
		
		cri.setMemberId(memberId);
		cri.setSelDate(selDate);
		cri.setPerPageNum(10);
		
		List<Map<String,Object>> chatAccountList = trainerPageService.selectChatAccountList(cri);
		model.addAttribute("chatAccountList", chatAccountList);
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//전체 글 개수 세팅
		int total = trainerPageService.selectChatCnt(cri);
		pageMaker.setTotalCount(total);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("selDate", selDate);
		model.addAttribute("totalCount" , total);
		
		//차트 정보 
		Map<String,Object> chartResult = trainerPageService.selectChartInfo(memberId);
		model.addAttribute("chartResult", chartResult);
		System.out.println("모델");
		
		System.out.println(model.toString());
		
		return "trainerPage/chatAccountInfo";
	}
	
	@RequestMapping(value = "myClassInfo.do", method = RequestMethod.GET)
	public String myClassInfo(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model, HttpServletRequest request,
			   Criteria cri,
			   @RequestParam(value="selCate", required=false) String selCate, 
			   @RequestParam(value="selLev", required=false) String selLev,
			   @RequestParam(value="keyword", required=false) String keyword) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}
		
		cri.setMemberId(memberId);
		cri.setSelCate(selCate);
		cri.setSelLev(selLev);
		cri.setKeyword(keyword);
		cri.setPerPageNum(10);
		
		List<Map<String,Object>> classList = trainerPageService.selectTrainerClassList(cri);
		model.addAttribute("classList", classList );
		
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//전체 글 개수 세팅
		int total = trainerPageService.selectTrainerClassCnt(cri);
		System.out.println("개수 : " + total);
		pageMaker.setTotalCount(total);
		model.addAttribute("pageMaker",pageMaker);
		
		model.addAttribute("selCate", selCate);
	   	model.addAttribute("selLev", selLev);
	   	model.addAttribute("keyword", keyword);
//		
//		//차트 정보 
//		Map<String,Object> chartResult = trainerPageService.selectChartInfo(memberId);
//		model.addAttribute("chartResult", chartResult);
//		System.out.println("모델");
//		
		System.out.println(model.toString());
		return "trainerPage/myClassInfo";
	}
	
	@RequestMapping(value = "classAccountInfo.do", method = RequestMethod.GET)
	public String classAccountInfo(HttpServletRequest request, Model model, Criteria cri,
			@RequestParam(value = "selDate", required = false) String selDate) throws Exception{
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}
		cri.setMemberId(memberId);
		cri.setSelDate(selDate);
		cri.setPerPageNum(10);

		List<Map<String,Object>> classAccountList = trainerPageService.selectClassAccountList(cri);
		model.addAttribute("classAccountList", classAccountList);
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//전체 글 개수 세팅
		int total = trainerPageService.selectClassCnt(cri);
		pageMaker.setTotalCount(total);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("selDate", selDate);
		model.addAttribute("totalCount" , total);
		
//		차트 정보 
		Map<String,Object> chartResult = trainerPageService.selectChart2Info(memberId);
		model.addAttribute("chartResult", chartResult);
		System.out.println("모델");
		System.out.println(model.toString());

		return "trainerPage/classAccountInfo";
	}
		
	
}
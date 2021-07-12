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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.stringtemplate.v4.compiler.CodeGenerator.list_return;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import kr.or.profit.service.TrainerPageService;
import kr.or.profit.vo.Criteria;
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
	public String myClassInfo(Locale locale, Model model) {

		return "trainerPage/myClassInfo";
	}
	
	@RequestMapping(value = "teachList.do", method = RequestMethod.GET)
	public String teachList(Locale locale, Model model) {

		return "trainerPage/teachList";
	}
	
	@RequestMapping(value = "pdf.do", method = RequestMethod.GET)
	public String pdf(Model model) throws Exception {
//		// PDF를 작성하는 html
//		String html = 
//		"<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\"\r\n" + 
//		"    pageEncoding=\"UTF-8\"%>\r\n" + 
//		"<!DOCTYPE html>" + 
//		"<html>" +
//		"<head></head>" +
//		"<body>" +
//		"<div>Hello world</div>" +
//		"<div>예진입니다.</div>" +
//		"</body>" +
//		"</html>";
//		// 파일 IO 스트림을 취득한다.
//		try (FileOutputStream os = new FileOutputStream("\\\\192.168.41.6\\upload\\profit\\work\\test.pdf")) {
//		// Pdf형식의 document를 생성한다.
//		Document document = new Document(PageSize.A4, 10, 10, 10, 10);
//		// PdfWriter를 취득한다.
//		PdfWriter writer = PdfWriter.getInstance(document, os);
//		// document Open한다.
//		document.open();
//		// css를 설정할 resolver 인스턴스 생성
//		StyleAttrCSSResolver cssResolver = new StyleAttrCSSResolver();
//		// Css 파일 설정 (css1.css 파일 설정)
//		try (FileInputStream cssStream = new FileInputStream("\\\\192.168.41.6\\upload\\profit\\work\\css1.css")) {
//		cssResolver.addCss(XMLWorkerHelper.getCSS(cssStream));
//		}
//		// Css 파일 설정 (css2.css 파일 설정)
//		try (FileInputStream cssStream = new FileInputStream("\\\\192.168.41.6\\upload\\profit\\work\\css2.css")) {
//		cssResolver.addCss(XMLWorkerHelper.getCSS(cssStream));
//		}
//		// 폰트 설정
//		XMLWorkerFontProvider font = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
//		// window 폰트 설정
//		font.register("c:/windows/fonts/gulim.ttc", "Gulim");
//		// 폰트 인스턴스를 생성한다.
//		CssAppliersImpl cssAppliers = new CssAppliersImpl(font);
//		//htmlContext의 pipeline 생성. (폰트 인스턴스 생성)
//		HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
//		htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
//		// pdf의 pipeline 생성.
//		PdfWriterPipeline pdfPipeline = new PdfWriterPipeline(document, writer);
//		// Html의pipeline을 생성 (html 태그, pdf의 pipeline설정)
//		HtmlPipeline htmlPipeline = new HtmlPipeline(htmlContext, pdfPipeline);
//		// css의pipeline을 합친다.
//		CssResolverPipeline cssResolverPipeline = new CssResolverPipeline(cssResolver, htmlPipeline);
//		//Work 생성 pipeline 연결
//		XMLWorker worker = new XMLWorker(cssResolverPipeline, true);
//		//Xml 파서 생성(Html를 pdf로 변환)
//		XMLParser xmlParser = new XMLParser(true, worker, Charset.forName("UTF-8"));
//		// 출력한다.
//		try (StringReader strReader = new StringReader(html)) {
//		xmlParser.parse(strReader);
//		}
//		// document의 리소스 반환
//		document.close();
//		} catch (Throwable e) {
//		e.printStackTrace();
//		}


		return "trainerPage/teachList";
	}
	
	
	
	
	
}
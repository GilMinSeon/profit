package kr.or.profit.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.profit.service.CommunityService;
import kr.or.profit.vo.CommunityVO;


/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class CommunityController {
	@Resource(name = "communityService")
	private CommunityService communityService;
	
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
	
	@RequestMapping(value = "boardAdd.do", method = RequestMethod.GET)
	public String boardAdd(Locale locale, Model model) {
		
		return "community/boardAdd";
	}
	
	@RequestMapping(value = "boardMod", method = RequestMethod.GET)
	public String boardMod(Locale locale, Model model) {
		
		return "community/boardMod";
	}
	
	@RequestMapping(value="profileImage.do",  method=RequestMethod.POST)
	@ResponseBody
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
	response.setContentType("text/html;charset=utf-8");
	System.out.println("휴...");
	PrintWriter out = response.getWriter();
	// 업로드할 폴더 경로
	String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
	UUID uuid = UUID.randomUUID();

	// 업로드할 파일 이름
	String org_filename = file.getOriginalFilename();
	String str_filename = uuid.toString() + org_filename;

	System.out.println("원본 파일명 : " + org_filename);
	System.out.println("저장할 파일명 : " + str_filename);

	String filepath = "\\\\192.168.41.6\\upload\\profit" + "\\" +str_filename;
	System.out.println("파일경로 : " + filepath);
	String finalpath = "http://192.168.41.6:9999/upload/profit/" + str_filename;
	System.out.println("최종경로 : " + finalpath);

	File f = new File(filepath);
	if (!f.exists()) {
	f.mkdirs();
	}
	file.transferTo(f);
	out.println(finalpath);
	out.close();
	}
	
	@RequestMapping(value = "boardAddAjax.do", method = RequestMethod.POST)
	public String boardAddAjax(HttpServletResponse response, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		PrintWriter out = response.getWriter();
		
		String cate_type = request.getParameter("cate_type");
		String title = request.getParameter("title");
		String editordata = request.getParameter("editordata");
		System.out.println("cate_type : " + cate_type);
		System.out.println("title : " + title);
		System.out.println("editordata : " + editordata);
		
		CommunityVO vo = new CommunityVO();
		vo.setCommunityCategorySeq(cate_type);
		vo.setCommonTitle(title);
		vo.setCommonContent(editordata);
		vo.setInUserId(memberId);
		vo.setUpUserId(memberId);
		
		int insertResult = communityService.insertBoard(vo);
		
		String msg = "ng";
	       
        if(insertResult > 0) {
           msg = "ok";
           out.println("alert('정상적으로 등록되었습니다')");
           return "community/boardList";
        }else {
        	out.println("alert('추가 도중 문제가 발생하였습니다. 다시 시도해 주세요')");
           return "community/boardAdd";
        }
        
		
	}
	
}

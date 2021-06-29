package kr.or.profit.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

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


/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class CommunityController {
	
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
	
//	@RequestMapping(value = "uploadSummernoteImageFileAjax.do", method = RequestMethod.GET)
//	public String uploadSummernoteImageFileAjax(Locale locale, Model model) {
//		System.out.println("제발");
//		return "community/boardAdd";
//	}
	
	@RequestMapping(value="profileImage.do",  method=RequestMethod.POST)
	@ResponseBody
	public void profileUpload(String folderName, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
	response.setContentType("text/html;charset=utf-8");
	System.out.println("folderName : " + folderName );
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

	String filepath = realFolder + "\\" + folderName + "\\" + str_filename;
	System.out.println("파일경로 : " + filepath);

	File f = new File(filepath);
	if (!f.exists()) {
	f.mkdirs();
	}
	file.transferTo(f);
	out.println("profileUpload/"+folderName+"/"+str_filename);
	out.close();
	}
	
}

package kr.or.profit.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.profit.service.MemberService;
import kr.or.profit.service.MypageService;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class MypageController {
	@Resource(name = "mypageService")
	private MypageService mypageService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	private static final String CURR_IMAGE_REPO_PATH = 
            "D:\\A_TeachingMaterial\\6.JspSpring\\other\\images";
//	@RequestMapping(value="/form")
//	public String form() {
//	    return "uploadForm";
//	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "myinfo", method = RequestMethod.GET)
	public String myinfo(Locale locale, Model model) {
		
		return "mypage/myinfo";
	}
	
	@RequestMapping(value = "bookmark", method = RequestMethod.GET)
	public String bookmark(Locale locale, Model model) {
		
		return "mypage/bookmark";
	}
	
	@RequestMapping(value = "trainerApply", method = RequestMethod.GET)
	public String trainerApply(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		
		//로그인 생기면 제거해주세용~
        session.setAttribute("memberId", "dpwls64");
        session.setAttribute("memberGubun", "U");
        //
        
        String memberId = (String) session.getAttribute("memberId");
        
        List<Map<String, String>> list = mypageService.selectMemberInfo(memberId);
        String memberName = list.get(0).get("MEMBER_NAME");
        String memberGender = list.get(0).get("MEMBER_GENDER");
        String memberMobile = list.get(0).get("MEMBER_MOBILE");

        model.addAttribute("memberName", memberName);
        model.addAttribute("memberGender", memberGender);
        model.addAttribute("memberMobile", memberMobile);
        
        return "mypage/trainerApply";
        
	}
	
//	@RequestMapping(value="trainerApplyResult", method = RequestMethod.POST)
//	public String fileUp(MultipartHttpServletRequest multi) {
//		System.out.println("여기");
//		String path="C:/";
//		String fileName="";
//		
//		File dir = new File(path);
//		if(!dir.isDirectory()) {
//			dir.mkdir();
//		}
//		
//		Iterator<String> files = multi.getFileNames();
//		System.out.println(files.hasNext());
//		while(files.hasNext()) {
//			String uploadFile = files.next();
//			
//			MultipartFile mFile = multi.getFile(uploadFile);
//			fileName = mFile.getOriginalFilename();
//			System.out.println("실제 파일 이름 : " + fileName );
//			try {
//				mFile.transferTo(new File(path+fileName));
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return "trainerApply";
//	}
	
	@RequestMapping(value = "trainerInfo", method = RequestMethod.GET)
	public String trainerInfo(Locale locale, Model model) {
		
		return "mypage/trainerInfo";
	}
	
	@RequestMapping(value = "listenList", method = RequestMethod.GET)
	public String listenList(Locale locale, Model model) {
		
		return "mypage/listenList";
	}
	
	@RequestMapping(value = "teachList", method = RequestMethod.GET)
	public String teachList(Locale locale, Model model) {
		
		return "mypage/teachList";
	}
	
	@RequestMapping(value = "pwdMod", method = RequestMethod.GET)
	public String pwdMod(Locale locale, Model model) {
		
		return "mypage/pwdMod";
	}
	
	@RequestMapping(value = "mobileMod", method = RequestMethod.GET)
	public String mobileMod(Locale locale, Model model) {
		
		return "mypage/mobileMod";
	}

	@RequestMapping(value = "payDetail", method = RequestMethod.GET)
	public String payDetail(Locale locale, Model model) {
		
		return "mypage/payDetail";
	}
	
	@RequestMapping(value = "ticketPayList", method = RequestMethod.GET)
	public String ticketPayList(Locale locale, Model model) {
		
		return "mypage/ticketPayList";
	}
	
	@RequestMapping(value = "ticketPayDetail", method = RequestMethod.GET)
	public String ticketPayDetail(Locale locale, Model model) {
		
		return "mypage/ticketPayDetail";
	}
	
	@RequestMapping(value = "myChatList", method = RequestMethod.GET)
	public String myChatList(Locale locale, Model model) {
		
		return "mypage/myChatList";
	}
	
	@RequestMapping(value = "myChatDetail", method = RequestMethod.GET)
	public String myChatDetail(Locale locale, Model model) {
		
		return "mypage/myChatDetail";
	}
	
	
	@RequestMapping(value="form")
	public String form() {
	    return "mypage/test";
	}
	
	@RequestMapping(value="upload", method=RequestMethod.GET)
    public ModelAndView uploadGet(ModelAndView mav) throws Exception{
		mav.setViewName("mypage/result");
		return mav;
	}
	
	@RequestMapping(value="upload", method=RequestMethod.POST)
    public void upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
        multipartRequest.setCharacterEncoding("utf-8");
        Map map = new HashMap();
        Enumeration enu = multipartRequest.getParameterNames();
        
        String gendType = multipartRequest.getParameter("gendType");
        String trainerGym = multipartRequest.getParameter("trainerGym");
        System.out.println("gendType : " + gendType);
        System.out.println("trainerGym : " + trainerGym);
        
        List fileList = fileProcess(multipartRequest);
        for(int i=0;i<fileList.size();i++) {
        	String name = fileList.get(i).toString();
        	map.put("file"+(i+1), name);
        }
        map.put("fileList", fileList);
        
        
    }
    
    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) 
        throws Exception{
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        
        while(fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originalFileName = mFile.getOriginalFilename();
            fileList.add(originalFileName);
            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
            if(mFile.getSize() != 0) {
                if(!file.exists()) {
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();
                    }
                }
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
            }
        }
        return fileList;
    }
    
}

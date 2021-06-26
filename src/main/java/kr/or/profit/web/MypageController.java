package kr.or.profit.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.profit.service.MemberService;
import kr.or.profit.service.MypageService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.ProcessVO;

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
            "\\\\192.168.41.6\\upload\\profit";
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "myinfo.do", method = RequestMethod.GET)
	public String myinfo(Locale locale, Model model) {
		
		return "mypage/myinfo";
	}
	
	@RequestMapping(value = "bookmark.do", method = RequestMethod.GET)
	public String bookmark(Locale locale, Model model) {
		
		return "mypage/bookmark";
	}
	
	@RequestMapping(value = "trainerApply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String trainerApply(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		
		//좀이따 지워야함
		session.setAttribute("memberId", "S00001");
		
        String memberId = (String) session.getAttribute("memberId");
        System.out.println("memberId : " + memberId);
        List<Map<String, String>> list = mypageService.selectMemberInfo(memberId);
        System.out.println(list.toString());
        String memberName = list.get(0).get("memberName");
        String memberGender = list.get(0).get("memberGender");
        String memberMobile = list.get(0).get("memberMobile");

        model.addAttribute("memberName", memberName);
        model.addAttribute("memberGender", memberGender);
        model.addAttribute("memberMobile", memberMobile);
        
        return "mypage/trainerApply";
        
	}
	
	@RequestMapping(value = "trainerInfo.do", method = RequestMethod.GET)
	public String trainerInfo(Locale locale, Model model) {
		
		return "mypage/trainerInfo";
	}
	
	@RequestMapping(value = "listenList.do", method = RequestMethod.GET)
	public String listenList(Locale locale, Model model) {
		
		return "mypage/listenList";
	}
	
	@RequestMapping(value = "teachList.do", method = RequestMethod.GET)
	public String teachList(Locale locale, Model model) {
		
		return "mypage/teachList";
	}
	
	@RequestMapping(value = "pwdMod.do", method = RequestMethod.GET)
	public String pwdMod(Locale locale, Model model) {
		
		return "mypage/pwdMod";
	}
	
	@RequestMapping(value = "mobileMod.do", method = RequestMethod.GET)
	public String mobileMod(Locale locale, Model model) {
		
		return "mypage/mobileMod";
	}

	@RequestMapping(value = "payDetail.do", method = RequestMethod.GET)
	public String payDetail(Locale locale, Model model) {
		
		return "mypage/payDetail";
	}
	
	@RequestMapping(value = "ticketPayList.do", method = RequestMethod.GET)
	public String ticketPayList(Locale locale, Model model) {
		
		return "mypage/ticketPayList";
	}
	
	@RequestMapping(value = "ticketPayDetail.do", method = RequestMethod.GET)
	public String ticketPayDetail(Locale locale, Model model) {
		
		return "mypage/ticketPayDetail";
	}
	
	@RequestMapping(value = "myChatList.do", method = RequestMethod.GET)
	public String myChatList(Locale locale, Model model) {
		
		return "mypage/myChatList";
	}
	
	@RequestMapping(value = "myChatDetail.do", method = RequestMethod.GET)
	public String myChatDetail(Locale locale, Model model) {
		
		return "mypage/myChatDetail";
	}
	
	@RequestMapping(value="result.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String result() {
	    return "mypage/result";
	}
	
	@RequestMapping(value="uploadAjax.do", method=RequestMethod.POST)
	@ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response, HttpServletRequest request) throws Exception{
        HttpSession session = request.getSession();
        multipartRequest.setCharacterEncoding("utf-8");
        
        
        //회원 정보 Process Table에 Insert
        String trainerAward = multipartRequest.getParameter("trainerAward");
        String trainerCareer = multipartRequest.getParameter("trainerCareer");
        String trainerGym = multipartRequest.getParameter("trainerGym");
        
        
        ProcessVO vo = new ProcessVO();
        
        String loginMemberId = (String)session.getAttribute("memberId");
        vo.setMemberId(loginMemberId);
        vo.setTrainerAward(trainerAward);
        vo.setTrainerCareer(trainerCareer);
        vo.setTrainerGym(trainerGym);
        vo.setInUserId(loginMemberId);
        vo.setUpUserId(loginMemberId);
        mypageService.insertProcess(vo);
        
        
        //다중파일 List로 담아 File 테이블에 추가
	    Map map = new HashMap();
	    Enumeration enu = multipartRequest.getParameterNames();
	        
	    List fileList = fileProcess(multipartRequest);
	    List fileListUid = new ArrayList<>();
	    List<AttachFileVO> fileVOList = new ArrayList<AttachFileVO>();
	    
	    for(int i=1; i<fileList.size()+1; i++) {
//	    	System.out.println("uid 이름");
//	    	fileListUid.add(multipartRequest.getParameter("file" + i + "_uid"));
	    	
//	    	AttachFileVO fileVO = new AttachFileVO();
	    	
//	    	String realname = multipartRequest.getParameter("file" + i);
//	    	String savename = multipartRequest.getParameter("file" + i + "_uid");
//	    	String path = CURR_IMAGE_REPO_PATH + savename;
	    	
//	    	fileVO.setMemberId((String)session.getAttribute("memberId"));
//	    	fileVO.setFileRealName(realname);
//	    	fileVO.setFileSaveName(savename);
//	    	fileVO.setFilePath(path);
//	    	
//	    	fileVOList.add(fileVO);
	    }
	    
	    
        
        return "ok";
        
    }
    
    private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) 
        throws Exception{
        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        
        while(fileNames.hasNext()) {
        	UUID uuid = UUID.randomUUID();
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originalFileName = mFile.getOriginalFilename();
            fileList.add(originalFileName);
            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + uuid + fileName);
            if(mFile.getSize() != 0) {
                if(!file.exists()) {
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();
                    }
                }
                
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + uuid + originalFileName));
            }
        }
        return fileList;
    }
    
}

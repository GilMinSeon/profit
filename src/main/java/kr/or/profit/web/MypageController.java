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
        
        //파일업로드
        List<AttachFileVO> fileVOList = fileProcess(multipartRequest, request);
        
        //파일 DB 저장
        Map<String, Object> filemap = new HashMap<String, Object>();
        filemap.put("list", fileVOList);
        int insertResult = mypageService.insertProcessFile(filemap);
        
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
        
       String msg = "ng";
       
       if(insertResult > 0) {
          msg = "ok";
       }
        return msg;
        
    }
    
    private List<AttachFileVO> fileProcess(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) 
        throws Exception{
       HttpSession session = request.getSession();
       
       List<AttachFileVO> fileVOList = new ArrayList<AttachFileVO>();
//        List<String> fileList = new ArrayList<String>();
        Iterator<String> fileNames = multipartRequest.getFileNames();
        int cnt = 1;
        while(fileNames.hasNext()) {
           
           
           UUID uuid = UUID.randomUUID();
           
           System.out.println("uuid : " + uuid);
            String fileName = fileNames.next();
            System.out.println("fileName : " + fileName);
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originalFileName = mFile.getOriginalFilename();
            File file = new File(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString() + "_" + originalFileName);
            if(mFile.getSize() != 0) {
                if(!file.exists()) {
                    if(file.getParentFile().mkdir()) {
                        file.createNewFile();
                    }
                }
                
                mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString()  + "_" + originalFileName));
            }
            
            String memberId = (String)session.getAttribute("memberId");
            //attach_file 테이블에 저장할 vo list
            AttachFileVO attachvo = new AttachFileVO();
            attachvo.setFileDetailSeq(Integer.toString(cnt));
            attachvo.setFileRealName(originalFileName);
            attachvo.setFileSaveName(uuid.toString()  + "_" + originalFileName);
            attachvo.setFilePath(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString()  + "_" + originalFileName);
            attachvo.setInUserId(memberId);
            attachvo.setUpUserId(memberId);
            fileVOList.add(attachvo);
            cnt++;
          }
        System.out.println("insert 할 것");
        return fileVOList;
    }
    
}
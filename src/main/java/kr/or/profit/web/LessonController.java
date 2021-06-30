package kr.or.profit.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.profit.service.AttachFileService;
import kr.or.profit.service.LessonService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.LessonVO;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class LessonController {
   
   private static final Logger logger = LoggerFactory.getLogger(LessonController.class);
   private static final String CURR_IMAGE_REPO_PATH = 
            "\\\\192.168.41.6\\upload\\profit";
   @Resource(name="lessonService")
   private LessonService lessonService;
   
   @Resource(name = "fileService")
   private AttachFileService fileService;
   
   /**
    * 강의 목록 조회 -나중에 페이징처리하자민정아
    * @param locale
    * @param model
    * @return
    */
   @RequestMapping(value = "lessonList.do",  method = {RequestMethod.GET, RequestMethod.POST})
   public String lessonList(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  { 
      List<?> lessonList = lessonService.selectLessonList();
      model.addAttribute("resultList", lessonList);
//      List<?> lessonTopList = lessonService.selectTopLessonList();
//      model.addAttribute("resultTopList", lessonTopList);
      System.out.println("dddddddddddd"+model);
      return "lesson/lessonList";
   }
   
   /**
    * 강의 상세 조회
    * @param lessonVO
    * @param locale
    * @param model
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "lessonDetail.do",  method = {RequestMethod.GET, RequestMethod.POST})
   public String lessonDetail(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  { 
      Map<String, Object> lessonDetailList = lessonService.selectLessonDetail(lessonVO);
      model.addAttribute("resultList", lessonDetailList);
      System.out.println("제발찍혀라" + model);
      return "lesson/lessonDetail";
   }
   
   
   
   
   /**
    * 강의 등록
    * @param lessonVO - 등록할 정보가 담긴 VO
    * @param
    * @return
    * @throws Exception 
    */
   @RequestMapping(value = "lessonAdd.do", method = {RequestMethod.GET, RequestMethod.POST})
   public String lessonAdd(HttpServletRequest request, Model model) throws Exception {
	
      return "lesson/lessonAdd";
   }
   
   /**
    * 강의 등록하는 ajax 
    * @param multipartRequest
    * @param response
    * @param request
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "lesson_insAjax.do", method = RequestMethod.POST)
   @ResponseBody
   public String lessonAdd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response, HttpServletRequest request) throws Exception{
      HttpSession session = request.getSession();      
      multipartRequest.setCharacterEncoding("utf-8");
      
      
    //파일업로드
      List<AttachFileVO> fileVOList = fileLesson(multipartRequest, request);
      
    //파일 DB 저장
      Map<String, Object> filemap = new HashMap<String, Object>();
      filemap.put("list", fileVOList);
      System.out.println("filemap이다 이놈아  "+filemap.toString());
      int insertResult = lessonService.insertLessonFile(filemap);
      
      
    //강의 정보 Table에 Insert
      String lessonCategorySeq = multipartRequest.getParameter("lessonCategorySeq");
      String lessonTitle = multipartRequest.getParameter("lessonTitle");
      String lessonTitleComment = multipartRequest.getParameter("lessonTitleComment");
      String lessonBalance = multipartRequest.getParameter("lessonBalance");
      String lessonFlex = multipartRequest.getParameter("lessonFlex");
      String lessonStrong = multipartRequest.getParameter("lessonStrong");
      String lessonCore = multipartRequest.getParameter("lessonCore");
      String lessonIntro = multipartRequest.getParameter("lessonIntro");
      String lessonPrice = multipartRequest.getParameter("lessonPrice");
      String lessonMonth = multipartRequest.getParameter("lessonMonth");
      
      LessonVO vo = new LessonVO();
      
      String loginMemberId = (String)session.getAttribute("memberId");
      String fileSeq = (String) filemap.get("fileSeq");
      vo.setFileSeq(fileSeq);
      vo.setLessonCategorySeq(lessonCategorySeq);
      vo.setLessonTitle(lessonTitle);
      vo.setLessonTitleComment(lessonTitleComment);
      vo.setLessonBalance(lessonBalance);
      vo.setLessonFlex(lessonFlex);
      vo.setLessonStrong(lessonStrong);
      vo.setLessonCore(lessonCore);
      vo.setLessonIntro(lessonIntro);
      vo.setLessonPrice(lessonPrice);
      vo.setLessonMonth(lessonMonth);
      vo.setInUserId(loginMemberId);
      vo.setUpUserId(loginMemberId);
      lessonService.insertLesson(vo);
      
      String msg = "ng";
      
      if(insertResult > 0) {
         msg = "ok";
      }
       return msg;
      
 
   }
   
   /**
    * 파일 업로드 메서드
    * @param multipartRequest
    * @param request
    * @return
    * @throws Exception
    */
   private List<AttachFileVO> fileLesson(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) 
	        throws Exception{
	       HttpSession session = request.getSession();
	       
	       List<AttachFileVO> fileVOList = new ArrayList<AttachFileVO>();
	       
	       Iterator<String> fileNames = multipartRequest.getFileNames();
	       
	       while(fileNames.hasNext()) {
	           
	           
	           UUID uuid = UUID.randomUUID();
	           
	           System.out.println("uuid : " + uuid);
	            String fileName = fileNames.next();
	            System.out.println("fileName : " + fileName);
	            MultipartFile mFile = multipartRequest.getFile(fileName);
	            String originalFileName = mFile.getOriginalFilename();
	            System.out.println("originalFileName"+originalFileName);
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
	            System.out.println("세션에 있니??  " + memberId);
	            
	            AttachFileVO attachvo = new AttachFileVO();
	            attachvo.setFileRealName(originalFileName);
	            attachvo.setFileSaveName(uuid.toString()  + "_" + originalFileName);
	            attachvo.setFilePath(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString()  + "_" + originalFileName);
	            attachvo.setInUserId(memberId);
	            attachvo.setUpUserId(memberId);
	            fileVOList.add(attachvo);
	          }
	        System.out.println("insert 할 것");
	        return fileVOList;
	    }
   
   
   
   
   
   /**
    * 강의를 수정한다 
    * @param locale
    * @param model
    * @return
    */
   @RequestMapping(value = "lessonMod.do")
   public String lessonMod(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  {
      Map<String, Object> lessonDetailList = lessonService.selectLessonDetail(lessonVO);
      model.addAttribute("resultList", lessonDetailList);
      System.out.println("수정으로 간다" + model);
      return "lesson/lessonMod";
   }
   
   /**
    * 강의 수정 -파일수정 강의 수정
    * @param multipartRequest
    * @param response
    * @param request
    * @return
    * @throws Exception
    */
   @RequestMapping(value = "lesson_modAjax.do", method = RequestMethod.POST)
   @ResponseBody
   public String lessonModFinish(MultipartHttpServletRequest multipartRequest, HttpServletResponse response, HttpServletRequest request) throws Exception{
	    HttpSession session = request.getSession();      
	    multipartRequest.setCharacterEncoding("utf-8");
	      
	      
	    //파일업로드
	    List<AttachFileVO> fileVOList = fileLesson(multipartRequest, request);
	      
	    //파일 DB 저장
	    Map<String, Object> filemap = new HashMap<String, Object>();
	    filemap.put("list", fileVOList);
	    System.out.println("filemap이다 이놈아22  "+filemap.toString());
	    int insertResult = lessonService.insertLessonFile(filemap);
	    
	  //강의 정보 Table에 update
	  String lessonSeq = multipartRequest.getParameter("lessonSeq");
      String lessonCategorySeq = multipartRequest.getParameter("lessonCategorySeq");
      String lessonTitle = multipartRequest.getParameter("lessonTitle");
      String lessonTitleComment = multipartRequest.getParameter("lessonTitleComment");
      String lessonBalance = multipartRequest.getParameter("lessonBalance");
      String lessonFlex = multipartRequest.getParameter("lessonFlex");
      String lessonStrong = multipartRequest.getParameter("lessonStrong");
      String lessonCore = multipartRequest.getParameter("lessonCore");
      String lessonIntro = multipartRequest.getParameter("lessonIntro");
      String lessonPrice = multipartRequest.getParameter("lessonPrice");
      String lessonMonth = multipartRequest.getParameter("lessonMonth");
	    
      System.out.println("강의 seq 는 무엇? "+ lessonSeq);
      System.out.println("카테고리는 무엇? "+lessonCategorySeq);
      System.out.println("제목 무엇? "+lessonTitle);
      System.out.println("코멘트는 무엇? "+lessonTitleComment);
      System.out.println("밸런스 무엇? "+lessonBalance);
      System.out.println("유연 무엇? "+lessonFlex);
      System.out.println("스트롱는 무엇? "+lessonStrong);
      System.out.println("코어 무엇? "+lessonCore);
      System.out.println("스트롱는 무엇? "+lessonStrong);
      System.out.println("인트로 무엇? "+lessonIntro);
      System.out.println("가격 무엇? "+lessonPrice);
      System.out.println("기간 무엇? "+lessonMonth);
       
      LessonVO vo = new LessonVO();
      String loginMemberId = (String)session.getAttribute("memberId");
      String fileSeq = (String) filemap.get("fileSeq");	//14
      System.out.println("여기 fileSeq는 뭐니 " + fileSeq);
      vo.setFileSeq(fileSeq);
      vo.setLessonSeq(lessonSeq);
      vo.setLessonCategorySeq(lessonCategorySeq);
      vo.setLessonTitle(lessonTitle);
      vo.setLessonTitleComment(lessonTitleComment);
      vo.setLessonBalance(lessonBalance);
      vo.setLessonFlex(lessonFlex);
      vo.setLessonStrong(lessonStrong);
      vo.setLessonCore(lessonCore);
      vo.setLessonIntro(lessonIntro);
      vo.setLessonPrice(lessonPrice);
      vo.setLessonMonth(lessonMonth);
      vo.setUpUserId(loginMemberId);
      lessonService.updateLesson(vo);
      
      String msg = "ng";
      
      if(insertResult > 0) {
         msg = "ok";
      }
       return msg;
	   
   }
   
   
   /**
    * 강의 삭제
 * @throws Exception 
    */
   @RequestMapping(value = "lesson_delAjax.do", method = RequestMethod.GET)
   @ResponseBody
   public String lessonDel(LessonVO lessonVO, Locale locale, Model model) throws Exception {
      String lessonSeq = lessonVO.getLessonSeq();
      System.out.println("lessonSeq?= " + lessonSeq);
      lessonVO.setLessonSeq(lessonSeq);
	  int cnt = lessonService.deleteLesson(lessonVO);
      String msg = "ng";
      
      if(cnt > 0) {
         msg = "ok";
      }
      System.out.println(msg);
       return msg;
   }
   

   @RequestMapping(value = "classDetail.do", method = RequestMethod.GET)
   public String classDetail(Locale locale, Model model) {
      
      return "lesson/classDetail";
   }
   @RequestMapping(value = "classAdd.do", method = RequestMethod.GET)
   public String classAdd(Locale locale, Model model) {
      
      return "lesson/classAdd";
   }
   @RequestMapping(value = "classMod.do", method = RequestMethod.GET)
   public String classMod(Locale locale, Model model) {
      
      return "lesson/classMod";
   }

   @RequestMapping(value = "test", method = RequestMethod.GET)
   public String test(Locale locale, Model model) {
      
      return "lesson/test";
   }
   
}

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
	@RequestMapping(value = "lessonList.do", method = RequestMethod.GET)
	public String lessonList(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  { 
//		List<?> lessonList = lessonService.selectLessonList();
//		model.addAttribute("resultList", lessonList);
////		System.out.println("dddddddddddd"+model);
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
	@RequestMapping(value = "lessonDetail.do", method = RequestMethod.GET)
	public String lessonDetail(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  { 
//		Map<String, Object> lessonDetailList = lessonService.selectLessonDetail(lessonVO);
//		model.addAttribute("resultList", lessonDetailList);
//		System.out.println("제발찍혀라" + model);
		return "lesson/lessonDetail";
	}
	
	
	
	
	/**
	 * 강의 등록
	 * @param lessonVO - 등록할 정보가 담긴 VO
	 * @param
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "lessonAdd.do", method = RequestMethod.GET)
	public String lessonAdd(Locale locale, Model model) {
		
		return "lesson/lessonAdd";
	}
	
//	@RequestMapping(value = "lesson_insAjax.do", method = RequestMethod.POST)
//	@ResponseBody
//	public String lessonAdd(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  {
////		System.out.println(lessonVO.getLessonTitle());
//		
//		System.out.println(fileVO.getFileRealName());
//		
//		String message = "";
//		int cnt = fileService.insertLessonFile(fileVO);
//		System.out.println(fileVO.getFileSeq());
//		String fileSeq = fileVO.getFileSeq();
//		
//		lessonVO.setFileSeq(fileSeq);
//		
//		int cnt1 = lessonService.insertLesson(lessonVO);
//		if(cnt == 1 && cnt1 == 1 ) {
//			message = "ok";
//		}
//		return message;
//	}
	
	@RequestMapping(value = "lesson_insAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String lessonAdd(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, MultipartHttpServletRequest multipartRequest,HttpServletRequest request,Model model) throws Exception  {
//		HttpSession session = request.getSession();		
		multipartRequest.setCharacterEncoding("utf-8");
		
		//파일업로드
		List<AttachFileVO> fileVOList = fileLesson(multipartRequest, request);
		
		//파일 db저장
        Map<String, Object> filemap = new HashMap<String, Object>();
        filemap.put("list", fileVOList);
        int insertResult = lessonService.insertLessonFile(filemap);
		
//		System.out.println(fileVO.getFileRealName());
		
//		String message = "";
//		int cnt = fileService.insertLessonFile(fileVO);
//		System.out.println(fileVO.getFileSeq());
        
        //파일seq를 lessonvo에 셋팅
		String fileSeq = fileVOList.get(0).getFileSeq();
		lessonVO.setFileSeq(fileSeq);
        
        
//        String loginMemberId = (String)session.getAttribute("memberId");
		lessonService.insertLesson(lessonVO);

		String msg = "ng";
	       
	       if(insertResult > 0) {
	          msg = "ok";
	       }
	        return msg;
	}
	
    private List<AttachFileVO> fileLesson(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) 
            throws Exception{
           HttpSession session = request.getSession();
           
           List<AttachFileVO> fileVOList = new ArrayList<AttachFileVO>();
            List<String> fileList = new ArrayList<String>();
            Iterator<String> fileNames = multipartRequest.getFileNames();
//            int cnt = 1;
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
//                attachvo.setFileDetailSeq(Integer.toString(cnt));
                attachvo.setFileRealName(originalFileName);
                attachvo.setFileSaveName(uuid.toString()  + "_" + originalFileName);
                attachvo.setFilePath(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString()  + "_" + originalFileName);
                attachvo.setInUserId(memberId);
                attachvo.setUpUserId(memberId);
                fileVOList.add(attachvo);
//                cnt++;
              }
//            System.out.println("insert 할 것");
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
//		Map<String, Object> lessonDetailList = lessonService.selectLessonDetail(lessonVO);
//		model.addAttribute("resultList", lessonDetailList);
//		System.out.println("수정으로 간다" + model);
		return "lesson/lessonMod";
	}
	
	@RequestMapping(value = "lesson_modAjax.do")
	@ResponseBody
	public String lessonModFinish(@ModelAttribute("lessonVO") LessonVO lessonVO, AttachFileVO fileVO, Model model) throws Exception  {
		
		model = model.addAttribute("data", lessonVO);
		
		String message = "";
		int cnt = lessonService.updateLesson(lessonVO);
//		int cnt1 = fileService.updateLessonFile(fileVO);
		if(cnt == 1 ) {
			message = "ok";
		}
		return message;
	}
	
	/**
	 * 강의 삭제
	 */
	@RequestMapping(value = "lesson_delAjax.do", method = RequestMethod.GET)
	public String lessonDel(LessonVO lessonVO, Locale locale, Model model) {
//		int cnt = lessonService.deleteLesson(lessonVO);
		return "lesson/classDetail";
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

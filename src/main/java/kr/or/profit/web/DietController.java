package kr.or.profit.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.DietService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.ChatProfileVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;
//import kr.or.profit.vo.ChatProfileVO;
import kr.or.profit.vo.ReplyVO;
import net.sf.json.JSONObject;

/**
 * 
 * Handles requests for the application home page.
 */
@Controller
public class DietController {
	@Resource(name = "dietService")
	private DietService dietService;
	
	MypageController mc = new MypageController();
	
	private static final Logger logger = LoggerFactory.getLogger(DietController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "chatList.do", method = RequestMethod.GET)
	public String chatList(HttpServletRequest request , Model model) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if(memberId == null) {
			return "member/loginForm";
		}
		//이용권이 존재하면 구매 못하도록 막기
		int ticketFlag = dietService.selectAvailableTicket(memberId);
		if(ticketFlag > 0) {
			model.addAttribute("msg", "ng");
		}else {
			model.addAttribute("msg", "ok");
		}
		
		//트레이너가 프로필 등록이 되어있으면 등록을 못하도록 막기
		int profileFlag = dietService.selectRegisterProfile(memberId);
		
		if(profileFlag > 0) {
			model.addAttribute("profileFlag", "ng");
		}else {
			model.addAttribute("profileFlag", "ok");
		}
		
		//상담 프로필 목록 가져오기
		List<Map<String, Object>> chatList = dietService.selectChatProflieList();
		
		model.addAttribute("chatList", chatList);
		
		System.out.println(model.toString());
		
		return "diet/chatList";
	}
	
	
	@RequestMapping(value = "chatProfilePrivate.do", method = RequestMethod.GET)
	public void chatProfilePrivate(@RequestParam String chatProfileSeq, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int updateResult = dietService.updatePrivate(chatProfileSeq);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		if(updateResult > 0) {
			out.println("<script>alert('프로필이 비활성화 되었습니다.'); location.href='chatList.do';</script>"); 
		}else {
			out.println("<script>alert('프로필 비활성화에 실패하였습니다. 다시 시도해주세요.'); location.href='chatList.do';</script>"); 
		}
		out.flush();
	}
	
	@RequestMapping(value = "chatProfilePublic.do", method = RequestMethod.GET)
	public void chatProfilePublic(@RequestParam String chatProfileSeq, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		int updateResult = dietService.updatePublic(chatProfileSeq);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		if(updateResult > 0) {
			out.println("<script>alert('프로필이 활성화 되었습니다.'); location.href='chatList.do';</script>"); 
		}else {
			out.println("<script>alert('프로필 활성화에 실패하였습니다. 다시 시도해주세요.'); location.href='chatList.do';</script>"); 
		}
		out.flush();
	}
	
	@RequestMapping(value = "chatProfileAdd.do", method = RequestMethod.GET)
	public String chatProfileAdd(Locale locale, Model model) {
		return "diet/chatProfileAdd";
	}

	@RequestMapping(value = "chatDetail.do", method = RequestMethod.GET)
	public String chatDetail(@RequestParam String chatProfileSeq, HttpServletRequest request,  Model model) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		//상세 정보 가져오기
		Map<String,Object> chatDetail = dietService.selectChatProfileDetail(chatProfileSeq);
		
		//문의 목록 가져오기
		List<Map<String, Object>> replyList = dietService.selectReplyList(chatProfileSeq);
		chatDetail.put("replyList", replyList);
		
		//문의 댓글 내 기본 이미지 가져오기
		String myprofile = dietService.selectMyProfile(memberId);
		System.out.println("기본이미지 : " + myprofile);
		chatDetail.put("MyProfileImage", myprofile);
		
		model.addAttribute("chatDetail", chatDetail);
		System.out.println(model.toString());
		return "diet/chatDetail";
	}
	
	@RequestMapping(value = "chatReplyAddAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String chatReplyAddAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		String chatProfileSeq = request.getParameter("chatProfileSeq");
		String replyContent = request.getParameter("replyContent");

		System.out.println("chatProfileSeq : " + chatProfileSeq);
		System.out.println("replyContent : " + replyContent);

		ReplyVO replyvo = new ReplyVO();
		replyvo.setChatProfileSeq(chatProfileSeq);
		replyvo.setReplyContent(replyContent);
		replyvo.setInUserId(memberId);
		replyvo.setUpUserId(memberId);

		int insertResult = dietService.insertChatReply(replyvo);

		String msg = "ng";

		if (insertResult > 0) {
			msg = "ok";
		}
		return msg;
	}
	
	//프로필 수정
	@RequestMapping(value = "chatProfileModAjax.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String chatProfileModAjax(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multipartRequest) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		boolean fileFlag = multipartRequest.getFileNames().hasNext();
		System.out.println(multipartRequest.getFileNames().hasNext());
		
		List<AttachFileVO> fileVOList = null;
		if(fileFlag == true) {
			//파일업로드
			fileVOList = mc.fileProcess(multipartRequest, request);
			
			// 파일 DB 저장
			Map<String, Object> filemap = new HashMap<String, Object>();
			filemap.put("list", fileVOList);
			System.out.println(fileVOList.get(0).getFileDetailSeq());
			System.out.println(fileVOList.get(0).getFilePath());
			System.out.println(fileVOList.get(0).getFileRealName());
			System.out.println(fileVOList.get(0).getFileSaveName());
			System.out.println(fileVOList.get(0).getInUserId());
			int insertFileResult = dietService.insertProcessFile(filemap);
			System.out.println("updateFileResult : " + insertFileResult);
		}


		String simpleIntro = request.getParameter("simpleIntro");
		String profileMemo = request.getParameter("profileMemo");
		String chatProfileSeq = request.getParameter("chatProfileSeq");
		
		ChatProfileVO chatProfileVo = new ChatProfileVO();
		chatProfileVo.setChatProfileSeq(chatProfileSeq);
		if(fileFlag == true) {
			chatProfileVo.setFileSeq("ok");
		}
		chatProfileVo.setChatProfileId(memberId);
		chatProfileVo.setChatProfileIntro(simpleIntro);
		chatProfileVo.setChatProfileMemo(profileMemo);
		chatProfileVo.setInUserId(memberId);
		chatProfileVo.setUpUserId(memberId);
		
		System.out.println("============================");
		System.out.println(chatProfileVo.getFileSeq());
		System.out.println(chatProfileVo.getChatProfileIntro());
		System.out.println(chatProfileVo.getChatProfileMemo());
		
		int updateResult = dietService.updateChatProfile(chatProfileVo);
		
	    String msg="ng";
	    
		if(updateResult > 0) {
			msg = "ok";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "chatRereplyAddAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String rereplyAddAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		String chatProfileSeq = request.getParameter("chatProfileSeq");
		String replyContent = request.getParameter("replyContent");
		String replyParentSeq = request.getParameter("replyParentSeq");

		System.out.println("chatProfileSeq : " + chatProfileSeq);
		System.out.println("replyContent : " + replyContent);
		System.out.println("replyParentSeq : " + replyParentSeq);

		ReplyVO replyvo = new ReplyVO();
		replyvo.setChatProfileSeq(chatProfileSeq);
		replyvo.setReplyContent(replyContent);
		replyvo.setReplyParentSeq(replyParentSeq);
		replyvo.setInUserId(memberId);
		replyvo.setUpUserId(memberId);

		int insertResult = dietService.insertChatRereply(replyvo);

		String msg = "ng";

		if (insertResult > 0) {
			msg = "ok";
		}
		return msg;
	}
	
	
	/**
    * 이용권 구매 목록 페이지 
    * @author 정예진
    * @param model
    * @return String - community/boardAdd
    * @throws Exception
    */
	@RequestMapping(value = "buyTicket.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String buyTicket(Model model, HttpServletRequest request) throws Exception{
		
		
		return "diet/buyTicket";
	}
	
	@RequestMapping(value = "buyTicketDetail.do", method = RequestMethod.GET)
	public String buyTicketDetail(@RequestParam String ticketCategorySeq, HttpServletRequest request,  Model model) throws Exception{
		
		Map<String, Object> ticketCategory = dietService.selectTicketCategory(ticketCategorySeq);
		model.addAttribute("ticketCategory" , ticketCategory);
		System.out.println(model.toString());
		
		return "diet/buyTicketDetail";
	}
	
	
	@RequestMapping(value = "ticketAddAjax.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String ticketAddAjax(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		String ticketCategorySeq = request.getParameter("ticketCategorySeq");
		String ticketName = request.getParameter("ticketName");
		String ticketPrice = request.getParameter("ticketPrice");
		String ticketCnt = request.getParameter("ticketCnt");
		
		System.out.println("ticketCategorySeq : " + ticketCategorySeq);
		System.out.println("ticketName : " + ticketName );
		System.out.println("ticketPrice : " + ticketPrice );
		System.out.println("ticketCnt : " + ticketCnt );
		
		BuyTicketVO buyTicketvo = new BuyTicketVO();
		buyTicketvo.setTicketCategorySeq(ticketCategorySeq);
		buyTicketvo.setTicketRemain(ticketCnt);
		buyTicketvo.setInUserId(memberId);
		buyTicketvo.setUpUserId(memberId);
		
		int insertResult = dietService.insertBuyTicket(buyTicketvo);

	    String msg="ng";
	    
		if(insertResult > 0) {
			msg = "ok";
		}
		
		return msg;
	}
	
	
		
	@RequestMapping(value = "chatProfileAddAjax.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String chatProfileAddAjax(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multipartRequest) throws Exception{
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		//파일업로드
		List<AttachFileVO> fileVOList = mc.fileProcess(multipartRequest, request);
		
		
		// 파일 DB 저장
		Map<String, Object> filemap = new HashMap<String, Object>();
		filemap.put("list", fileVOList);
		System.out.println("왜안돼");
		System.out.println(fileVOList.get(0).getFileDetailSeq());
		System.out.println(fileVOList.get(0).getFilePath());
		System.out.println(fileVOList.get(0).getFileRealName());
		System.out.println(fileVOList.get(0).getFileSaveName());
		System.out.println(fileVOList.get(0).getInUserId());
		int insertFileResult = dietService.insertProcessFile(filemap);
		System.out.println("insertFileResult : " + insertFileResult);
		
		
		String simpleIntro = request.getParameter("simpleIntro");
		String profileMemo = request.getParameter("profileMemo");
		
		ChatProfileVO chatProfileVo = new ChatProfileVO();
		chatProfileVo.setFileSeq(fileVOList.get(0).getFileSeq());
		chatProfileVo.setChatProfileId(memberId);
		chatProfileVo.setChatProfileIntro(simpleIntro);
		chatProfileVo.setChatProfileMemo(profileMemo);
		chatProfileVo.setInUserId(memberId);
		chatProfileVo.setUpUserId(memberId);
		
		System.out.println("============================");
		System.out.println(chatProfileVo.getFileSeq());
		System.out.println(chatProfileVo.getChatProfileIntro());
		System.out.println(chatProfileVo.getChatProfileMemo());
		int insertResult = dietService.insertChatProfile(chatProfileVo);
		
	    String msg="ng";
	    
		if(insertResult > 0) {
			msg = "ok";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "chatProfileMod.do", method = RequestMethod.GET)
	public String chatProfileMod(@RequestParam String chatProfileSeq, HttpServletRequest request,  Model model) throws Exception{
		
		Map<String, Object> chatProfile = dietService.selectChatProfileDetail(chatProfileSeq);
		model.addAttribute("chatProfile" , chatProfile);
		System.out.println(model.toString());
		
		return "diet/chatProfileMod";
	}
	
		
	@RequestMapping(value = "chatting", method = RequestMethod.GET)
	public String chatting(Locale locale, Model model) {
		return "diet/chatting";
	}
	
	@RequestMapping(value = "kcalList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kcalList(Model model, HttpServletRequest request, Criteria cri,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws Exception{
		
		System.out.println("searchKeyword : " + searchKeyword);
		
		cri.setPerPageNum(10);
		cri.setSearchKeyword(searchKeyword);
		
		//칼로리 정보 목록 조회
		List<Map<String, Object>> kcalList = dietService.selectKcalList(cri);
		
		model.addAttribute("kcalList", kcalList);
		System.out.println("칼로리목록");
		System.out.println(kcalList.toString());
		
		//페이징 처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//전체 글 개수 세팅
		pageMaker.setTotalCount(dietService.selectKcalCnt(cri));
		System.out.println(dietService.selectKcalCnt(cri) + "가져오는 개수!!!");
		model.addAttribute("pageMaker",pageMaker);
		
		//입력한 검색어 유지시키기
		model.addAttribute("searchKeyword", searchKeyword);
		
		System.out.println("최종 모델");
		System.out.println(model);
		
		return "diet/kcalList";
	}
	
	@RequestMapping(value = "kcalNumAjax.do", method = { RequestMethod.GET, RequestMethod.POST },produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String kcalNumAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String kcalNum = request.getParameter("kcalNum");
		System.out.println("칼로리시퀀스 : " + kcalNum);
		Map<String, Object> kcalDetail = dietService.selectkcalDetail(kcalNum);
		System.out.println("칼로리디테일");
		System.out.println(kcalDetail.toString());
		
		JSONObject jsonObject = new JSONObject();
		
		if (kcalDetail.size() > 0) {
			jsonObject.put("msg", "ok");
			jsonObject.put("num", kcalDetail.get("num"));
			jsonObject.put("descKor", kcalDetail.get("descKor"));
			jsonObject.put("servingSize", kcalDetail.get("servingSize"));
			jsonObject.put("nutrCont1", kcalDetail.get("nutrCont1"));
			jsonObject.put("nutrCont2", kcalDetail.get("nutrCont2"));
			jsonObject.put("nutrCont3", kcalDetail.get("nutrCont3"));
			jsonObject.put("nutrCont4", kcalDetail.get("nutrCont4"));
			jsonObject.put("nutrCont5", kcalDetail.get("nutrCont5"));
			jsonObject.put("nutrCont6", kcalDetail.get("nutrCont6"));
		} else {
			jsonObject.put("msg", "ng");
		}
		String jsonInfo = jsonObject.toString();
		return jsonInfo;
		
	}
	
	@RequestMapping(value = "kcalDetail.do", method = RequestMethod.GET)
	public String kcalDetail(Locale locale, Model model) {
		return "diet/kcalDetail";
	}
	
	@RequestMapping(value = "test22.do", method = RequestMethod.GET)
	public String test22(Locale locale, Model model) {
		return "diet/test";
	}
	
	
}

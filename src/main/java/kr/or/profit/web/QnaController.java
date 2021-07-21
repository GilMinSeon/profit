package kr.or.profit.web;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.io.File;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.QnaService;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;
import kr.or.profit.vo.ReplyVO;

@Controller
public class QnaController {

	@Resource(name = "qnaService")
	private QnaService qnaService;
	@Resource(name = "communityService")
	private CommunityService communityService;

	/**
	 * 문의하기 목록(qnaList)
	 *
	 * @author 박상빈
	 * @param HttpSession, Criteria, ModelMap
	 * @return String
	 * @exception Exception
	 */
	/**
	 * 문의하기 목록(qnaList)
	 *
	 * @author 박상빈
	 * @param ssion memberId 로그인 아이디 가지고옴
	 * @param map   아이디를 가지고 Qna_SQL.xml 간다
	 * @param model data변수명에 qnaList를 가지고 html으로간다
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	public String qnaList(HttpServletRequest request, Criteria cri, ModelMap model) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		String memberGubun = (String) session.getAttribute("memberGubun");
		if (memberId == null) {
			memberId = "";
		}
		if ( memberGubun == null) {
			memberGubun = "";
		}
		System.out.println("memberId : " +  memberId);
		System.out.println("memberGubun : " +  memberGubun);
		
		cri.setMemberId(memberId);
		cri.setPerPageNum(10);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		if(memberGubun.equals("A")) {
			List<Map<String,Object>> qnaList = qnaService.selectAdminQnaList(cri);
			model.addAttribute("qnaList", qnaList);
			//전체글 개수
			pageMaker.setTotalCount(qnaService.selectAdminQnaCnt(cri)); 
		}else {
			List<Map<String,Object>> qnaList = qnaService.selectUserQnaList(cri);
			model.addAttribute("qnaList", qnaList);
			//전체글 개수
			pageMaker.setTotalCount(qnaService.selectUserQnaCnt(cri)); 
		}
		
		model.addAttribute("pageMaker" , pageMaker);
		System.out.println(model.toString());
		return "qna/qnaList";
	}

	/**
	 * 문의하기 상세보기/답변 목록(qnaDetail)
	 *
	 * @author 박상빈
	 * @param Map, HttpSession, ModelMap
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaDetail.do", method = RequestMethod.GET)
	public String qnaDetail(@ModelAttribute("communityVO") CommunityVO communityVO, Model model,
			HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			String memberId = (String) session.getAttribute("memberId");
			String communitySeq = communityVO.getCommunitySeq();

			CommunityVO paramVO = new CommunityVO();
			paramVO.setMemberId(memberId);
			paramVO.setCommunitySeq(communitySeq);
			
			//문의하기 상세
			Map<String, Object> qnaDetail = qnaService.selectQnaDetail(paramVO);
			model.addAttribute("qnaDetail",qnaDetail);
			
			//댓글 프로필 사진
			String myprofile = qnaService.selectQnaMyProfile(memberId);
			System.out.println("기본이미지 : " + myprofile);
			qnaDetail.put("MyProfileImage", myprofile);
			
			// 댓글 목록
			List<Map<String, Object>> replyList = qnaService.selectQnaReplyList(communitySeq);
			qnaDetail.put("replyList", replyList);
			
			//댓글 수 가져오기
			Map<String,Object> replyCnt = qnaService.selectQnaReplyCnt(communitySeq);
			qnaDetail.put("replyCnt", replyCnt.get("cnt"));
			
			
			System.out.println(model.toString());
			
		return "qna/qnaDetail";
	}
	
	@RequestMapping(value = "qnaReplyAddAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String replyAddAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		String communitySeq = request.getParameter("communitySeq");
		String replyContent = request.getParameter("replyContent");

		System.out.println("communitySeq : " + communitySeq);
		System.out.println("replyContent : " + replyContent);

		ReplyVO replyvo = new ReplyVO();
		replyvo.setCommunitySeq(communitySeq);
		replyvo.setReplyContent(replyContent);
		replyvo.setInUserId(memberId);
		replyvo.setUpUserId(memberId);

		int insertResult = qnaService.insertQnaReply(replyvo);

		String msg = "ng";

		if (insertResult > 0) {
			msg = "ok";
		}
		return msg;
	}
	
	
	@RequestMapping(value = "qnaRereplyAddAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String rereplyAddAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");

		String communitySeq = request.getParameter("communitySeq");
		String replyContent = request.getParameter("replyContent");
		String replyParentSeq = request.getParameter("replyParentSeq");

		System.out.println("communitySeq : " + communitySeq);
		System.out.println("replyContent : " + replyContent);
		System.out.println("replyParentSeq : " + replyParentSeq);

		ReplyVO replyvo = new ReplyVO();
		replyvo.setCommunitySeq(communitySeq);
		replyvo.setReplyContent(replyContent);
		replyvo.setReplyParentSeq(replyParentSeq);
		replyvo.setInUserId(memberId);
		replyvo.setUpUserId(memberId);

		int insertResult = qnaService.insertQnaRereply(replyvo);

		String msg = "ng";

		if (insertResult > 0) {
			msg = "ok";
		}
		return msg;
	}
	
	
	@RequestMapping(value = "QnaReplyDelAjax.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String QnaReplyDelAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String replySeq = request.getParameter("replySeq");
		System.out.println("replySeq : " + replySeq);
		int deleteResult = qnaService.deleteQnaReply(replySeq);

		String msg = "ng";

		if (deleteResult > 0) {
			msg = "ok";
		}
		return msg;
	}
	
	/**
	 * 문의하기 등록(qnaAdd)
	 *
	 * @author 박상빈
	 * @param
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaAdd.do", method = RequestMethod.GET)
	public String qnaAdd() throws Exception {
		return "qna/qnaAdd";
	}
	


}
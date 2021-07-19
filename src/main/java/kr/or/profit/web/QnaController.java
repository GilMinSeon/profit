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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.QnaService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;

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
	 * @param ssion memberId 로그인 아이디 가지고옴
	 * @param map   아이디를 가지고 Qna_SQL.xml 간다
	 * @param model data변수명에 qnaList를 가지고 html으로간다
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	public String qnaList(HttpSession ssion, Criteria cri, ModelMap model) throws Exception {
		System.out.println("문의하기 목록옴 ");
		String memberId = (String) ssion.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}

		cri.setMemberId(memberId);

		System.out.println("문의하기 목록 온다" + memberId);
		List<?> qnaList = qnaService.qnaList(cri);
		System.out.println("문의하기 목록돌아옴 data " + qnaList);
		model.addAttribute("data", qnaList);

		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// 전체 글 개수 세팅 - 검색결과과 무관하게 페이징 생성 => 수정필요 => 수정 완
		pageMaker.setTotalCount(qnaService.selectBoardCnt(cri));

		System.out.println(qnaService.selectBoardCnt(cri) + "가져오는 개수!!!!!!!!!!!!");

		model.addAttribute("pageMaker", pageMaker);
		return "qna/qnaList";
	}

	/**
	 * 문의하기 add화면(qnaAdd)
	 *
	 * @author 박상빈
	 * @param
	 * @return "qna/qnaAdd"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaAdd.do", method = RequestMethod.GET)
	public String qnaAdd() throws Exception {
		return "qna/qnaAdd";
	}

	/**
	 * 문의하기 등록(qnaInsert)
	 *
	 * @author 박상빈
	 * @param ssion    로그인중인 아이디 가지고옴
	 * @param map      Qna_SQL.xml로 아이디 가지고감
	 * @param response html을 java에서 실행하기위해 사용
	 * @param model    data변수명에 qnaList를 가지고 html으로간다
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaAdd.do", method = RequestMethod.POST)
	public void qnaInsert(@RequestParam Map<String, Object> map, ModelMap model, HttpSession ssion, HttpServletResponse response) throws Exception {
		String memberId = (String) ssion.getAttribute("memberId");
		map.put("memberId", memberId);
		System.out.println("문의하 등록" + map);
		int qnaInsert = qnaService.qnaInsert(map);
		System.out.println("문의하기 등록하고 옴" + qnaInsert);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('문의하기가 등록 되었습니다'); location.href='qnaList.do';</script>");
		out.flush();
	}

	/**
	 * 문의하기 상세보기/답변 목록(qnaDetail)
	 *
	 * @author 박상빈
	 * @param map, ssion
	 * @param data, qnaReply, qnaDetailReplyList, qnaDetailMember
	 * @return "qna/qnaDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaDetail.do", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam Map<String, Object> map, HttpSession ssion, ModelMap model) throws Exception {
		map.put("memberId", ssion.getAttribute("memberId"));
		System.out.println("문의하기 상세화면옴" + map);

		Map<String, Object> qnaDetail = qnaService.qnaDetail(map);
		List<?> qnaDetailReply = qnaService.qnaDetailReply(map);
		List<?> qnaDetailReplyList = qnaService.qnaDetailReplyList(map);
		Map<String, Object> qnaDetailMember = qnaService.qnaDetailMember(map);

		System.out.println("문의하기 상세보기" + qnaDetail);
		System.out.println("댓글돌아 옴 = " + qnaDetailReply);
		System.out.println("대  댓글돌아옴 = " + qnaDetailReplyList);
		System.out.println("멤버 돌아옴 = " + qnaDetailMember);

		model.addAttribute("data", qnaDetail);
		model.addAttribute("qnaDetailReply", qnaDetailReply);
		model.addAttribute("qnaDetailReplyList", qnaDetailReplyList);
		model.addAttribute("qnaDetailMember", qnaDetailMember);
		return "qna/qnaDetail";
	}

	/**
	 * 문의하기 수정 화면(qnaMod)
	 *
	 * @author 박상빈
	 * @param map   Qna_SQL.xml로 communitySeq 가지고감
	 * @param model data변수명에 qnaDetail를 가지고 html으로간다
	 * @return "qna/qnaMod"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaMod.do", method = RequestMethod.GET)
	public String qnaMod(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		Map<String, Object> qnaDetail = qnaService.qnaDetail(map);
		model.addAttribute("data", qnaDetail);
		return "qna/qnaMod";
	}

	/**
	 * 문의하기 수정(qnaUpdate)
	 *
	 * @author 박상빈
	 * @param map   Qna_SQL.xml로 communitySeq 가지고감
	 * @param model data변수명에 qnaDetail를 가지고 html으로간다 qnaDetail 화면 새로고침을 위해 파라미터로 communitySeq가지고 qnaDetail.do로 간다 redirect:"(새로고칠 화면.jsp) 화면이름 이름"
	 * @return "redirect:qnaDetail.do?communitySeq="+map.get("communitySeq");
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaMod.do", method = RequestMethod.POST)
	public void qnaUpdate(@RequestParam Map<String, Object> map, ModelMap model, HttpServletResponse response) throws Exception {

		int qnaUpdate = qnaService.qnaUpdate(map);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('문의하기가 수정 되었습니다'); location.href='qnaList.do';</script>");
		out.flush();
	}

	/**
	 * 문의하기 글 삭제(qnaAdd)
	 *
	 * @author 박상빈
	 * @param map     qnaDetail에서 해당 communitySeq 가지고옴
	 * @param qnaList qnaList갈때 리스트 뿌릴거(여기서 않가지고가면 않나옴)
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaDelete.do", method = RequestMethod.GET)
	public void qnaDelete(@RequestParam Map<String, Object> map, ModelMap model, HttpSession ssion, HttpServletResponse response) throws Exception {
		String memberId = (String) ssion.getAttribute("memberId");
		map.put("memberId", memberId);

		int qnaDelete = qnaService.qnaDelete(map);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('문의하기가 삭제 되었습니다');location.href='qnaList.do';</script>");
		out.flush();
	}

	/**
	 * 게시판 이미지 업로드
	 *
	 * @author 박상빈
	 * @param MultipartFile,HttpServletRequest,HttpServletResponse
	 * @return 이미지, file.transferTo(f); = 함수로 f에담아서 넘겨주는 듯하다
	 * @throws Exception
	 */

	@RequestMapping(value = "qnaProfileImage.do", method = RequestMethod.POST)
	@ResponseBody
	public void qnaProfileImage(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("휴...");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + "_" + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = "\\\\192.168.41.6\\upload\\profit" + "\\" + str_filename;
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
	//==================================================================================================================================
	//댓글부분

	/**
	 * 댓글 등록(qnaReplyInsert)
	 *
	 * @author 박상빈
	 * @param map qnaReplyInsert 를 Qna_SQL.xml로 보낸다
	 * @return "msg"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaReplyInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String qnaReplyInsert(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		int qnaReplyInsert = qnaService.qnaReplyInsert(map);

		String msg = "ng";

		if (qnaReplyInsert > 0) {
			msg = "ok";
		}
		return msg;
	}

	/**
	 * 댓글 삭제(qnaReplyDelete)
	 *
	 * @author 박상빈
	 * @param map qnaReplyInsert 를 Qna_SQL.xml로 보낸다
	 * @return "msg"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaReplyDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String qnaReplyDelete(@RequestParam Map<String, Object> map, ModelMap model, HttpServletRequest request) throws Exception {

		int qnaReplyDelete = qnaService.qnaReplyDelete(map);

		String msg = "ng";
		if (qnaReplyDelete > 0) {
			msg = "ok";
		}
		return msg;
	}

	/**
	 * 문의하기 대 댓글 등록(qnaReply)
	 *
	 * @author 박상빈
	 * @param map
	 * @return msg
	 * @throws Exception
	 */

	@RequestMapping(value = "qnaReplyAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public String qnaReplyAdd(@RequestParam Map<String, Object> map, Model model) throws Exception {

		System.out.println("대댓글 옴" + map);
		int qnaReplyAdd = qnaService.qnaReplyAdd(map);

		String msg = "ng";
		if (qnaReplyAdd > 0) {
			msg = "ok";
		}

		return msg;
	}

}
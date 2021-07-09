package kr.or.profit.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.profit.service.NoticeService;

@Controller
public class NoticeController {

	@Resource(name = "noticeService")
	private NoticeService noticeService;


	/**
	 * 공지사항 목록(noticeList)
	 *
	 * @author 박상빈
	 * @param map
	 * Qna_SQL.xml로 communitySeq가지고간다
	 * @return "qna/qnaDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeList.do", method = RequestMethod.GET)
	public String noticeList(@RequestParam Map<String, Object> map, Model model) throws Exception {
		List<?> noticeList = noticeService.noticeList(map);
		model.addAttribute("data", noticeList);
		return "notice/noticeList";
	}


	/**
	 * 공지사항 등록(noticeAdd)
	 *
	 * @author 박상빈
	 * @param 화면용
	 * @return "notice/noticeAdd"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeAdd.do", method = RequestMethod.GET)
	public String noticeAdd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		return "notice/noticeAdd";
	}

	/**
	 * 공지사항 등록(noticeAdd)
	 *
	 * @author 박상빈
	 * @param map
	 * Notice_SQL.xml로 내용을 가지고간다
	 * @return "alert"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public void noticeInsert(@RequestParam MultipartHttpServletRequest multipartRequest, Map<String, Object> map, MultipartFile file, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("공지사항옴 = " + map);

		if(map.get("contents").equals("") || map.get("title").equals("")) {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('내용을 확인해주세요'); location.href=noticeAdd.do';</script>");
			out.flush();
		}

		int noticeInsert = noticeService.noticeInsert(map);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('공지사항이 등록 되었습니다'); location.href=noticeList.do';</script>");
		out.flush();
	}



	/**
	 * 조회수 증가(noticeHit)
	 *
	 * @author 박상빈
	 * @param 조회수 증가용
	 * @return "notice/noticeDetail"
	 * @exception Exception
	 */
	public void noticeCommonHit(Map<String, Object> map) throws Exception {
		int noticeCommonHit = noticeService.noticeCommonHit(map);
	}

	/**
	 * 공지사항 상세보기(noticeDetail)
	 *
	 * @author 박상빈
	 * @param map
	 * communitySeq > Notice_SQL.xml 이동
	 * @return "notice/noticeDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeDetail.do", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam Map<String, Object> map, Model model) throws Exception {
		noticeCommonHit(map);
		Map<String, Object> noticeDetail = noticeService.noticeDetail(map);

		model.addAttribute("data", noticeDetail);
		return "notice/noticeDetail";
	}

	/**
	 * 공지사항 수정하기(noticeMod)GET
	 *
	 * @author 박상빈
	 * @param map
	 * communitySeq > Notice_SQL.xml 이동
	 * @return "notice/noticeMod"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeMod.do", method = RequestMethod.GET)
	public String noticeMod(@RequestParam Map<String, Object> map, Model model) throws Exception {
		Map<String, Object> noticeDetail = noticeService.noticeDetail(map);
		model.addAttribute("data", noticeDetail);
		return "notice/noticeMod";
	}
	/**
	 * 공지사항 수정(noticeMod)POST
	 *
	 * @author 박상빈
	 * @param map
	 * communitySeq > Notice_SQL.xml 이동
	 * @return "notice/noticeDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeMod.do", method = RequestMethod.POST)
	public void noticeModUpdate(@RequestParam Map<String, Object> map, Model model, HttpServletResponse response) throws Exception {
		int noticeModUpdate = noticeService.noticeModUpdate(map);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('공지사항이 수정 되었습니다'); location.href='noticeList.do';</script>");
		out.flush();
	}

	/**
	 * 공지사항 글 삭제(qnaAdd)
	 *
	 * @author 박상빈
	 * @param map     qnaDetail에서 해당 communitySeq 가지고옴
	 * @param qnaList qnaList갈때 리스트 뿌릴거(여기서 않가지고가면 않나옴)
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeDelete.do", method = RequestMethod.GET)
	public void noticeDelete(@RequestParam Map<String, Object> map, ModelMap model, HttpServletResponse response) throws Exception {

		int noticeDelete = noticeService.noticeDelete(map);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('공지사항이 삭제 되었습니다');location.href='noticeList.do';</script>");
		out.flush();
	}



}

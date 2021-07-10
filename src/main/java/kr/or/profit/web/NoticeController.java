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
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.core.pattern.AbstractStyleNameConverter.Black;
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
	 * @param map Qna_SQL.xml로 communitySeq가지고간다
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
	 * @param map Notice_SQL.xml로 내용을 가지고간다
	 * @return "alert"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public void noticeInsert(@RequestParam Map<String, Object> map, MultipartFile file, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		HttpSession ssion = request.getSession();
		System.out.println("공지사항옴 = " + map);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		map.put("memberId", ssion.getAttribute("memberId"));
		String memberId = (String) map.get("memberId");
		//내용없을때
		if (map.get("contents").equals("") || map.get("title").equals("")) {
			System.out.println("여기온다");
			out.println("<script>alert('내용을 확인해주세요'); location.href='noticeAdd.do';</script>");
			out.flush();
			out.close();
		}

		System.out.println("공지사항 등록 옴");
		System.out.println("map" + map);

		String noticeFileName = qnaProfileUpload(file, request, response);
		String tumnalil_img = fileNameCnt(noticeFileName, memberId);

		System.out.println("tumnalil_img = " + tumnalil_img);
		System.out.println("noticeFileName = " + noticeFileName);

		map.put("tumnalil_img", tumnalil_img);
		System.out.println("파일 번호map에 in " + tumnalil_img);



		System.out.println("최종 정보 " + map);

		int noticeInsert = noticeService.noticeInsert(map);

		System.out.println("올라갔다" + noticeInsert);

//		ssion.setAttribute("message", "공지사항이 등록되었습니다.");
		out.println("<script>alert('내용을 확인해주세요'); location.href='noticeAdd.do';</script>");
		out.flush();
		out.close();
		System.out.println("올라갔다1111111111111111");
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
	 * @param map communitySeq > Notice_SQL.xml 이동
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
	 * @param map communitySeq > Notice_SQL.xml 이동
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
	 * @param map communitySeq > Notice_SQL.xml 이동
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

	/**
	 * 공지사항 파일 업로드
	 *
	 * @author 박상빈
	 * @param MultipartFile,HttpServletRequest,HttpServletResponse
	 * @return 파일, file.transferTo(f); = 함수로 f에담아서 넘겨주는 듯하다, 파일최종 이름 (finalpath)
	 * @throws Exception
	 */
	public String qnaProfileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("파일업로드옴.");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + "_" + org_filename;
		if (org_filename.equals("")) {
			System.out.println("null : " + org_filename);
			return "null";
		}
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
		out.flush();
		out.close();
		return finalpath;
	}

	/**
	 * 공지사항 파일 자르기
	 *
	 * @author 박상빈
	 * @param String
	 * @return String
	 * @throws Exception
	 */

	public String fileNameCnt(String noticeFileName, String memberId) throws Exception {

		System.out.println("noticeFileName = " + noticeFileName);
		String cnt = null;
		//파일 있으면 실행
		if (!(noticeFileName.equals("null"))) {
			System.out.println("작동한다 = " + noticeFileName);

			Map<String, Object> imgindexs = new HashMap<String, Object>();
			System.out.println("자르기시작");
			//파일이름 자르기1(처음이름)
			int index1 = noticeFileName.indexOf("profit/") + 44;
			String fileRealName = noticeFileName.substring(index1);
			System.out.println("path : " + fileRealName);

			//파일이름 자르기2(저장할이름)
			int index2 = noticeFileName.indexOf("profit/") + 7;
			String filesavename = noticeFileName.substring(index2);
			System.out.println("path : " + filesavename);
			System.out.println("자르기 끝");

			//파일이름 한곳에 넣기
			imgindexs.put("imgFile", noticeFileName);
			imgindexs.put("fileRealName", fileRealName);
			imgindexs.put("filesavename", filesavename);
			imgindexs.put("memberId", memberId);
			System.out.println("파일이름들 = " + imgindexs);

			//파일 이름 디비 저장
			int noticeFileUpload = noticeService.noticeFileUpload(imgindexs);
			System.out.println("파일디비 올라갔다" + noticeFileUpload);
			//파일 seq
			cnt = noticeService.noticeFileCnt();
			System.out.println("파일번호" + cnt);
		}else {
			cnt = "파일없음";
		}

		return cnt;
	}

}

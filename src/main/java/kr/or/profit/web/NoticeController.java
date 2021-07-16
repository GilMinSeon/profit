package kr.or.profit.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.NoticeService;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;

@Controller
public class NoticeController {

	@Resource(name = "noticeService")
	private NoticeService noticeService;
	@Resource(name = "communityService")
	private CommunityService communityService;

	/**
	 * 공지사항 목록(noticeList)
	 *
	 * @author 박상빈
	 * @param map Qna_SQL.xml로 communitySeq가지고간다
	 * @return "qna/qnaDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeList.do", method = RequestMethod.GET)
	public String noticeList(HttpSession ssion, Criteria cri, Model model) throws Exception {
		System.out.println("공지사항 list 옴");
		String memberId = (String) ssion.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}

		cri.setMemberId(memberId);

		System.out.println("공지사항 목록 온다" + memberId);

		List<?> noticeList = noticeService.noticeList(cri);

		System.out.println("공지사항 list 가지고갈거" + noticeList);

		model.addAttribute("data", noticeList);

		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// 전체 글 개수 세팅 - 검색결과과 무관하게 페이징 생성 => 수정필요 => 수정 완
		pageMaker.setTotalCount(noticeService.selectBoardCnt(cri));

		System.out.println(noticeService.selectBoardCnt(cri) + "가져오는 개수!!!!!!!!!!!!");

		model.addAttribute("pageMaker", pageMaker);
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
	public String noticeInsert(@RequestParam Map<String, Object> map, MultipartFile file, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession ssion = request.getSession();
		System.out.println("공지사항옴 = " + map);

		map.put("memberId", ssion.getAttribute("memberId"));
		String memberId = (String) map.get("memberId");
		//내용없을때

		System.out.println("공지사항 등록 옴");
		System.out.println("map" + map);

		//파일 등록
		String noticeFileName = qnaProfileUpload(file, request);
		System.out.println("공지사항옴 file = " + noticeFileName);

		//파일 번호 확인
		String tumnalil_img = fileNameCnt(noticeFileName, memberId);
		System.out.println("noticeFileName = " + noticeFileName);

		map.put("tumnalil_img", tumnalil_img);
		System.out.println("파일 번호map에 in " + tumnalil_img);

		System.out.println("최종 정보 " + map);

		int noticeInsert = noticeService.noticeInsert(map);

		System.out.println("올라갔다" + noticeInsert);

		return "ok";
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
		System.out.println("상세보기 옴" + map);
		noticeCommonHit(map);
		Map<String, Object> noticeDetail = noticeService.noticeDetail(map);
		System.out.println("상세보기 가지고 간다" + noticeDetail);

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
		System.out.println("공지사항 수정옴" + map);
		Map<String, Object> noticeDetail = noticeService.noticeDetail(map);
		System.out.println("공지사항 수정 내용 가지고옴" + noticeDetail);
		model.addAttribute("data", noticeDetail);
		return "notice/noticeMod";
	}

	/**
	 * 공지사항 수정post(noticeMod)POST
	 *
	 * @author 박상빈
	 * @param map communitySeq > Notice_SQL.xml 이동
	 * @return "notice/noticeDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "noticeMod.do", method = RequestMethod.POST)
	public void noticeModUpdate(@RequestParam Map<String, Object> map, MultipartFile file, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession ssion = request.getSession();
		String memboerId = (String) ssion.getAttribute("memberId");
		System.out.println("공지사항 수정옴(post)" + map);
		String communitySeq = (String) map.get("communitySeq");
		String fileRealName = (String) map.get("fileRealName");

		String qnaProfileUpload = qnaProfileUpload(file, request);
		System.out.println("파일 이름 가지고온다" + qnaProfileUpload);

		if (qnaProfileUpload.equals("파일없음")) {
			System.out.println("파일 없으면 여기로 돌아온다");
			qnaProfileUpload = fileRealName;
		} else {
			System.out.println("파일변경");
			String fileSeq = fileNameCnt(qnaProfileUpload, memboerId);
			map.put("fileSeq", fileSeq);
		}
		System.out.println("파일이름 = " + qnaProfileUpload);

		int noticeModUpdate = noticeService.noticeModUpdate(map);
		System.out.println("공지사항 수정 하고옴");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('공지사항이 수정 되었습니다'); location.href='noticeDetail.do?communitySeq=" + communitySeq + "';</script>");
		out.flush();
		//		response.setContentType("text/html; charset=UTF-8");
		//		PrintWriter out = response.getWriter();
		//		out.println("<script>alert('공지사항이 수정 되었습니다'); location.href='noticeList.do';</script>");
		//		out.flush();
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
	 * @throws IOException
	 * @throws IllegalStateException
	 * @throws Exception
	 */
	public String qnaProfileUpload(MultipartFile file, HttpServletRequest request) throws Exception {
		System.out.println("파일업로드옴");

		try {
			System.out.println(" 1 = " + file.getInputStream());
		} catch (Exception e) {
			System.out.println(e);
			return "파일없음";
		}
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름

		System.out.println("여기는와야지" + file);

		String org_filename = file.getOriginalFilename();
		//		String org_filename = file.getOriginalFilename();
		if (org_filename.equals("") || org_filename.equals(null)) {
			System.out.println("파일 없을때온다--------" + org_filename);
			return "파일없음";
		}
		String str_filename = uuid.toString() + "_" + org_filename;
		System.out.println("파일이름1 : " + org_filename);

		System.out.println("파일이름2 : " + str_filename);
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
			if (!(noticeFileName.equals("파일없음"))) {

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
			} else {
				//파일이름 한곳에 넣기
				imgindexs.put("imgFile", "파일없음");
				imgindexs.put("fileRealName", "파일없음");
				imgindexs.put("filesavename", "파일없음");
				imgindexs.put("memberId", memberId);
				System.out.println("파일이름들 = " + imgindexs);
			}
			//파일 이름 디비 저장
			int noticeFileUpload = noticeService.noticeFileUpload(imgindexs);
			System.out.println("파일디비 올라갔다" + noticeFileUpload);
			//파일 seq
			cnt = noticeService.noticeFileCnt();
			System.out.println("파일번호" + cnt);
		} else {
			//파일없으면 실행
			Map<String, Object> imgindexs = new HashMap<String, Object>();
			imgindexs.put("imgFile", "파일없음");
			imgindexs.put("fileRealName", "파일없음");
			imgindexs.put("filesavename", "파일없음");
			imgindexs.put("memberId", memberId);
			System.out.println("파일이름들 = " + imgindexs);
			//파일 이름 디비 저장
			int noticeFileUpload = noticeService.noticeFileUpload(imgindexs);
			System.out.println("파일디비 올라갔다" + noticeFileUpload);
			//파일 seq
			cnt = noticeService.noticeFileCnt();
			System.out.println("파일번호" + cnt);
		}

		return cnt;
	}

	/**
	 * 공지사항 파일 다운로드
	 *
	 * @author 박상빈
	 * @param String
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "qnaProfileDownload.do", method = RequestMethod.POST)
	//	@ResponseBody
	public void qnaProfileDownload(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		System.out.println("파일업로드옴." + map);

		Map<String, Object> resultMap = noticeService.qnaProfileDownload(map);
		System.out.println("파일주소." + resultMap);

		String storedFileName = (String) resultMap.get("fileSaveName");
		String originalFileName = (String) resultMap.get("fileSaveName");

		byte[] fileByte = org.apache.commons.io.FileUtils.readFileToByteArray(new File("\\\\192.168.41.6\\upload\\profit" + "\\" + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	//파일 삭제
	@RequestMapping(value = "noticeModDelFile.do", method = RequestMethod.GET)
	@ResponseBody
	public String noticeModDelFile(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		System.out.println("파일삭제옴" + map);
		map.put("fileRealName", "파일없음");
		int noticeModDelFile = noticeService.noticeModDelFile(map);

		System.out.println("삭제 하고 옴" + map);

		String msg = "ng";
		if (noticeModDelFile == 1) {
			msg = "ok";
		}
		return msg;
	}

}
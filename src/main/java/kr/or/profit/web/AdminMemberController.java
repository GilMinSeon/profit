package kr.or.profit.web;

import java.io.File;
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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.profit.service.AdminMemberService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;
import kr.or.profit.vo.ProcessVO;

@Controller
public class AdminMemberController {
	
	private static final String CURR_IMAGE_REPO_PATH = "\\\\192.168.41.6\\upload\\profit";
	
	@Resource(name = "adminMemberService")
	private AdminMemberService adminMemberService;
	
	
	//트레이너 승인 리스트
	@RequestMapping(value = "trainerPermitList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String fitness(Model model, HttpServletRequest request, Criteria cri,
			@RequestParam(value = "selStatus", required = false) String selStatus,
			@RequestParam(value = "selIdentity", required = false) String selIdentity,
			@RequestParam(value = "selDate", required = false) String selDate,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword) throws Exception{
		
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}
		
		cri.setSelStatus(selStatus);
		cri.setSelIdentity(selIdentity);
		cri.setSelDate(selDate);
		cri.setSearchKeyword(searchKeyword);
		cri.setPerPageNum(10);
		
		ProcessVO todayNumberList = adminMemberService.selectProcessNumberList();
		System.out.println(todayNumberList.toString());
		System.out.println(todayNumberList.getStatusDate());
		model.addAttribute("todayNumberList", todayNumberList);
		
		List<Map<String, Object>> processList = adminMemberService.selectProcessList(cri);
		model.addAttribute("processList", processList);
		
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(adminMemberService.selectProcessListCnt(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("selStatus", selStatus);
		model.addAttribute("selIdentity", selIdentity);
		model.addAttribute("selDate", selDate);
		model.addAttribute("searchKeyword", searchKeyword);
		
		
		System.out.println(todayNumberList.toString());
		System.out.println(processList.toString());
		
		return "adminMember/trainerPermitList";
	}
	
	//신청->검토 단계로 업데이트
	@RequestMapping("updateStatusBAjax.do")
	public @ResponseBody String updateStatusB(String processSeq) throws Exception {
		String message = "";
		int cnt = adminMemberService.updateStatusB(processSeq);
		if (cnt > 0) {
			message = "ok";
		}
		return message;
	}
	
	
	//각 디테일 페이지
	@RequestMapping(value = "trainerPermitDetail.do", method = RequestMethod.GET)
	public String trainerPermitDetail(Model model,
			@RequestParam(value = "processSeq", required = false) String processSeq
			) throws Exception {
		
		ProcessVO detailVO = adminMemberService.selectProcessDetailBySeq(processSeq);
		model.addAttribute("detailVO", detailVO);
		
		String fileSeq = detailVO.getFileSeq();
		List<?> fileVO = adminMemberService.selectProcessFile(fileSeq);
		model.addAttribute("fileVO", fileVO);
		
		return "adminMember/trainerPermitDetail";
	}
	
	
	//관리자가 트레이너 정보 수정
	@RequestMapping(value = "updateAdminPermitDetailAjax.do", method = RequestMethod.POST)
	public @ResponseBody String updateAdminPermitDetail(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response, HttpServletRequest request, ProcessVO processVO) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		//1. 관리자가 선택한 파일 삭제
		AttachFileVO deleteVO = new AttachFileVO();
		deleteVO.setFileSeq(processVO.getFileSeq());
		String[] arrayParam = multipartRequest.getParameterValues("delFile");
		if(arrayParam != null) {
			for (int i = 0; i < arrayParam.length; i++) {
				System.out.println(arrayParam[i]);
				deleteVO.setFileDetailSeq(arrayParam[i]);
				adminMemberService.deleteFileDetailSeq(deleteVO);
			}
		}
		
		//업로드할 파일 있는지 없는지 분기
		String fileDetailSeq = adminMemberService.selectFileDetailSeq(processVO.getFileSeq());
		String[] arrayText = multipartRequest.getParameterValues("text");
		
		if(arrayText != null) {
			System.out.println("널이 아니다");
			//파일업로드
			List<AttachFileVO> fileVOList = fileProcess(multipartRequest, request, processVO, fileDetailSeq);
			
			//2.attach_file 테이블에 insert
			Map<String, Object> filemap = new HashMap<String, Object>();
			filemap.put("list", fileVOList);
			int insCnt = adminMemberService.insertFilebyAdmin(filemap);
			System.out.println(insCnt);
			
			//3.process 테이블에 트레이너 정보 update
			int updCnt = adminMemberService.updateProcessInfo(processVO);
			System.out.println(updCnt);
			
		}else {
			System.out.println("널이다");
			//3.process 테이블에 트레이너 정보 update
			int updCnt = adminMemberService.updateProcessInfo(processVO);
			System.out.println(updCnt);
			
		}
		
		return "";
	}
	
	
	//uploadAjax 안에서 사용하는 메서드
	public List<AttachFileVO> fileProcess(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, ProcessVO processVO, String fileDetailSeq)
			throws Exception {
		
		List<AttachFileVO> fileVOList = new ArrayList<AttachFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		int detailSeq = Integer.parseInt(fileDetailSeq)+1;
		while (fileNames.hasNext()) {
			UUID uuid = UUID.randomUUID();
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString() + "_" + originalFileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + uuid.toString() + "_" + originalFileName));
			}
			AttachFileVO attachvo = new AttachFileVO();
			attachvo.setFileSeq(processVO.getFileSeq());
			attachvo.setFileDetailSeq(Integer.toString(detailSeq));
			attachvo.setFileRealName(originalFileName);
			attachvo.setFileSaveName(uuid.toString() + "_" + originalFileName);
			attachvo.setFilePath("http://192.168.41.6:9999/upload/profit/" + uuid.toString() + "_" + originalFileName);
			attachvo.setInUserId(processVO.getMemberId());
			attachvo.setUpUserId(processVO.getMemberId());
			fileVOList.add(attachvo);
			detailSeq++;
		}
		
		return fileVOList;
	}
	
	
	@RequestMapping(value = "adminMemberList.do", method = RequestMethod.GET)
	public String adminMemberList(Locale locale, Model model) {

		return "adminMember/adminMemberList";
	}
	@RequestMapping(value = "adminMemberDetail.do", method = RequestMethod.GET)
	public String adminMemberDetail(Locale locale, Model model) {

		return "adminMember/adminMemberDetail";
	}
	
	@RequestMapping(value = "adminSendMail.do", method = RequestMethod.GET)
	public String adminSendMail(Locale locale, Model model) {

		return "adminMember/adminSendMail";
	}
}
package kr.or.profit.web;

import java.util.List;
import java.util.Map;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequestWrapper;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.ibatis.sqlmap.engine.scope.SessionScope;

import kr.or.profit.service.QnaService;

@Controller
public class QnaController {

	@Resource(name = "qnaService")
	private QnaService qnaService;



	/**
	 * 문의하기 목록(qnaList)
	 *
	 * @author 박상빈
	 * @param List data에 넣어서 qna/qnaList로 간다
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	public String qnaList(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		List<?> qnaList = qnaService.qnaList();
		model.addAttribute("data", qnaList);
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
	 * @param if
	 * 파일이 비어있으면 null을 넣어준다
	 * @param model
	 * list로 data로 보내준다
	 * @param data
	 * 정상추가시 1반환
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaAdd.do", method = RequestMethod.POST)
	public String qnaInsert(@RequestParam Map<String, Object> map, ModelMap model, HttpSession ssion) throws Exception {

		if(map.get("files").equals("")) {
			map.put("files","파일없음");
		}
		map.put("memberId", ssion.getAttribute("memberId"));
		int qnaInsert = qnaService.qnaInsert(map);

		List<?> qnaList = qnaService.qnaList();
		model.addAttribute("data", qnaList);
		return "qna/qnaList";
	}

	/**
	 * 문의하기 상세보기(qnaDetail)
	 *
	 * @author 박상빈
	 * @param map
	 * qnaList에서 communitySeq 값을 가져온다
	 * @param model
	 * communitySeq해당하는 내용을 보내준다
	 * @return "qna/qnaDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaDetail.do", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		System.out.println("map : " + map);
		Map<String, Object> qnaDetail = qnaService.qnaDetail(map);
		model.addAttribute("data", qnaDetail);
		return "qna/qnaDetail";
	}
	/**
	 * 문의하기 수정 화면(qnaMod)
	 *
	 * @author 박상빈
	 * @param map
	 * qnaDetail에서 communitySeq 값을 가져온다
	 * @param qnaDetail
	 * data에 담아 넘겨준다
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
	 * 문의하기 수정(qnaMod)
	 *
	 * @author 박상빈
	 * @param if
	 * 파일이 없는 경우 파일없음 저장
	 * @param qnaDetail
	 * 화면 새로고침을 위해 파라미터로 communitySeq가지고 qnaDetail.do로 간다
	 * redirect:"(새로고칠 화면.jsp) 화면이름 이름"
	 * @return "redirect:qnaDetail.do?communitySeq="+map.get("communitySeq");
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaMod.do", method = RequestMethod.POST)
	public String qnaUpdate(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		if(map.get("files").equals("")) {
			map.put("files","파일없음");
		}
		int qnaUpdate = qnaService.qnaUpdate(map);
		Map<String, Object> qnaDetail = qnaService.qnaDetail(map);
		model.addAttribute("data", qnaDetail);
		return "redirect:qnaDetail.do?communitySeq="+map.get("communitySeq");
	}

	/**
	 * 문의하기 글 삭제(qnaAdd)
	 *
	 * @author 박상빈
	 * @param map
	 * qnaDetail에서 해당 communitySeq 가지고옴
	 * @param qnaList
	 * qnaList갈때 리스트 뿌릴거(여기서 않가지고가면 않나옴)
	 * @return "qna/qnaList"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaDelete.do", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		System.out.println("옴 = " + map);
		int qnaDelete = qnaService.qnaDelete(map);
		System.out.println("돌아옴 = " + qnaDelete);

		List<?> qnaList = qnaService.qnaList();
		model.addAttribute("data", qnaList);
		System.out.println("가지고갈거 = " + qnaList);
		return "redirect:qnaList.do";
	}
}
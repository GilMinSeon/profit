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
		System.out.println("model = " + model);
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
	public String qnaAdd(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		return "qna/qnaAdd";
	}

	/**
	 * 문의하기 생성(qnaInsert)
	 *
	 * @author 박상빈
	 * @param List
	 * @return "qna/qnaAdd"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaAdd.do", method = RequestMethod.POST)
	public String qnaInsert(@RequestParam Map<String, Object> map, ModelMap model, HttpSession ssion) throws Exception {
		map.put("memberId", ssion.getAttribute("memberId"));
		int qnaInsert = qnaService.qnaInsert(map);
		return "qna/qnaList";
	}

	/**
	 * 문의하기 상세보기(qnaDetail)
	 *
	 * @author 박상빈
	 * @param QnaVO data에 넣어서 qna/qnaDetail로 간다
	 * @return "qna/qnaDetail"
	 * @exception Exception
	 */
	@RequestMapping(value = "qnaDetail.do", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam Map<String, Object> map, ModelMap model) throws Exception {
		return "qna/qnaDetail";
	}
}
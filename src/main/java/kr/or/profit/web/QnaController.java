package kr.or.profit.web;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.profit.service.PopularService;

/**
 *
 * Handles requests for the application home page.
 */
@Controller
public class QnaController {

//	qnaservice 넣을자리
	@Resource(name = "popularService")
	private PopularService popularService;


	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	public String qnaList(@RequestParam Map<String, Object> map, Model model) throws Exception {
//		List<?> memberList = memberService.selectMemberList();
//		System.out.println("memberList" + memberList);
		return "qna/qnaList";
	}

}
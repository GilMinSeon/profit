package kr.or.profit.web;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.profit.vo.MemberVO;

@Controller
public class MemberController {

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {

		return "member/loginForm";
	}

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {

		return "member/joinForm";
	}

	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {

		return "member/findId";
	}

	@RequestMapping(value = "findPwd", method = RequestMethod.GET)
	public String findPwd(Locale locale, Model model) {

		return "member/findPwd";
	}

	@RequestMapping(value = "joinMemberTable", method = RequestMethod.POST)
	public String joinMemberTable(@ModelAttribute MemberVO vo) {
		System.out.println(vo.getMemberId());
		System.out.println("여기여기");
		return "member/findPwd";
	}

}
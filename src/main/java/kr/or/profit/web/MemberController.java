package kr.or.profit.web;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.profit.service.MemberService;
import kr.or.profit.vo.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;

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
	public String joinMemberTable(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");

		System.out.println(vo.getMemberId());
		System.out.println(vo.getMemberName());
		System.out.println(vo.getMemberGender());
		System.out.println("여기여기");
		memberService.insertMember(vo);
		
		return "member/findPwd";
	}
	
	
	@RequestMapping("idcheck")
	@ResponseBody
	public String selectMemberIdCheck(String memberId) throws Exception{
		String message = "";
		int cnt = memberService.selectMemberIdCheck(memberId);
		if(cnt == 0) {
			message = "ok";
		}
		return message;
	}
	
	@RequestMapping("nicknamecheck")
	@ResponseBody
	public String selectMemberNicknameCheck(String memberNickname) throws Exception{
		String message = "";
		int cnt = memberService.selectMemberNicknameCheck(memberNickname);
		if(cnt == 0) {
			message = "ok";
		}
		return message;
	}
	
	@RequestMapping("emailcheck")
	@ResponseBody
	public String selectMemberEmailCheck(String memberEmail) throws Exception{
		String message = "";
		int cnt = memberService.selectMemberEmailCheck(memberEmail);
		if(cnt == 0) {
			message = "ok";
		}
		return message;
	}
	
	
}
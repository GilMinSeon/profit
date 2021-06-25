package kr.or.profit.web;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		System.out.println(cnt);
		if(cnt == 0) {
			message = "ok";
		}
		System.out.println(message);
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
	
	
	@RequestMapping("loginWriteSub")
	@ResponseBody
	public String loginProcessing(MemberVO vo, HttpSession session) throws Exception{
		String msg = "";
		MemberVO membervo = memberService.selectMemberCount(vo);
		//System.out.println("sisi"+membervo.getMemberGubun());
		if(membervo != null) {
			//session 생성
			session.setAttribute("memberId", membervo.getMemberId());
			session.setAttribute("memberNickname", membervo.getMemberNickname());
			session.setAttribute("memberGubun", membervo.getMemberGubun());
			//message 처리
			msg = "ok";
		}else {
			msg = "no";
		}
		
		return msg;
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("memberId");
		session.removeAttribute("memberNickname");
		session.removeAttribute("memberGubun");
		return "redirect:home";

	}

	
}
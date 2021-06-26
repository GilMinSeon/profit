package kr.or.profit.web;

import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.profit.cmmn.TestMailer;
import kr.or.profit.service.MemberService;
import kr.or.profit.vo.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name = "testMailer")
	private TestMailer testMailer;
	
	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {

		return "member/loginForm";
	}

	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {

		return "member/joinForm";
	}

	@RequestMapping(value = "findId.do", method = RequestMethod.GET)
	public String findId(Locale locale, Model model) {

		return "member/findId";
	}

	@RequestMapping(value = "findPwd.do", method = RequestMethod.GET)
	public String findPwd(Locale locale, Model model) {

		return "member/findPwd";
	}

	@RequestMapping(value = "joinAjax.do", method = RequestMethod.POST)
	public String joinMemberTable(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.insertMember(vo);
		
		return "redirect:home.do";
	}
	
	
	@RequestMapping("idcheckAjax.do")
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
	
	@RequestMapping("nicknamecheckAjax.do")
	@ResponseBody
	public String selectMemberNicknameCheck(String memberNickname) throws Exception{
		String message = "";
		int cnt = memberService.selectMemberNicknameCheck(memberNickname);
		if(cnt == 0) {
			message = "ok";
		}
		return message;
	}
	
	@RequestMapping("emailcheckAjax.do")
	@ResponseBody
	public String selectMemberEmailCheck(String memberEmail) throws Exception{
		String message = "";
		int cnt = memberService.selectMemberEmailCheck(memberEmail);
		if(cnt == 0) {
			message = "ok";
		}
		return message;
	}
	
	
	@RequestMapping("loginSubmitAjax.do")
	@ResponseBody
	public String loginProcessing(MemberVO vo, HttpSession session) throws Exception{
		String msg = "";
		MemberVO membervo = memberService.selectMemberCount(vo);
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
	
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("memberId");
		session.removeAttribute("memberNickname");
		session.removeAttribute("memberGubun");
		return "redirect:home.do";

	}
	
	
	
	@RequestMapping(value = "/sendmailAjax.do")
	@ResponseBody
	public String sendmail(String memberEmail, String emailNum) {
		try {
			testMailer.sendMail(memberEmail, "PROFIT 회원가입 인증메일입니다. 인증번호를 확인해주세요.", 
					"안녕하세요 PROFIT 입니다.\n회원님의 인증번호는 "+emailNum+" 입니다.\n 홈페이지에서 이메일 인증번호를 입력하시면 회원가입이 완료됩니다 :) ");
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";			
		}
		
//		try {
//			testMailer.sendMail("받는대상", "이것은 제목", "스프링으로 구현해서 보내본다.","E:/파일위치","보낼파일명.확장자");
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "fail";			
//		}		
		return "ok";
	}	
	
	
	
	
	
	
	
	
	
	
	
}
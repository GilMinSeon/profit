package kr.or.profit.service;

import kr.or.profit.vo.MemberVO;

public interface MemberService {
	//회원가입-등록처리
	public void insertMember(MemberVO vo) throws Exception;
	
	//아이디 중복검사
	public int selectMemberIdCheck(String memberId) throws Exception;
	
	//닉네임 중복검사
	public int selectMemberNicknameCheck(String memberNickname) throws Exception;
	
	//이메일 중복검사
	public int selectMemberEmailCheck(String memberEmail) throws Exception;
	
	//로그인 처리
	public int selectMemberCount(MemberVO vo) throws Exception;
	
	
	
}

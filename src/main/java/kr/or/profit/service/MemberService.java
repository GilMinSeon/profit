package kr.or.profit.service;

import kr.or.profit.vo.MemberVO;

public interface MemberService {
	//회원가입-등록처리
	public void insertMember(MemberVO vo) throws Exception;
	
	//아이디 중복검사
	public int selectMemberIdCheck(String memberId) throws Exception;
}
package kr.or.profit.service;

import java.util.Map;

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
	public MemberVO selectMemberCount(MemberVO vo) throws Exception;

	//아이디 찾기 개수
	public int  findIdCnt(Map<String, Object> map) throws Exception;
	//아이디 찾기
	public MemberVO  findId(Map<String, Object> map) throws Exception;


}

package kr.or.profit.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.MemberVO;

//Mapper Interface => 메서드명과 쿼리ID를 매핑하여 쿼리호출

@Mapper("memberMapper")
public interface MemberMapper {
	//회원가입
	public void insertMember(MemberVO vo);
	
	//아이디 중복 검사
	public int selectMemberIdCheck(String memberId);
	
	//닉네임 중복 검사
	public int selectMemberNicknameCheck(String memberNickname);
	
	//이메일 중복 검사
	public int selectMemberEmailCheck(String memberEmail);
	
	//로그인 처리
	public int selectMemberCount(MemberVO vo);
	
	
}

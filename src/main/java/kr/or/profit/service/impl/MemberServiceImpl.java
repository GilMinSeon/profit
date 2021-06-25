package kr.or.profit.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.or.profit.mapper.MemberMapper;
import kr.or.profit.service.MemberService;
import kr.or.profit.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService{
	
	@Resource(name="memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		memberMapper.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String memberId) throws Exception {
		return memberMapper.selectMemberIdCheck(memberId);
	}
	
	@Override
	public int selectMemberNicknameCheck(String memberNickname) throws Exception {
		return memberMapper.selectMemberNicknameCheck(memberNickname);
	}
	
	@Override
	public int selectMemberEmailCheck(String memberEmail) throws Exception {
		return memberMapper.selectMemberEmailCheck(memberEmail);
	}

	@Override
	public MemberVO selectMemberCount(MemberVO vo) throws Exception {
		return memberMapper.selectMemberCount(vo);
	}




}

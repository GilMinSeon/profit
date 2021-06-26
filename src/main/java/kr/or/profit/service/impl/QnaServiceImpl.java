package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.or.profit.mapper.MemberMapper;
import kr.or.profit.mapper.QnaMapper;
import kr.or.profit.service.MemberService;
import kr.or.profit.service.QnaService;
import kr.or.profit.vo.MemberVO;

@Service("qnaService")
public class QnaServiceImpl extends EgovAbstractServiceImpl implements QnaService{
	
	@Resource(name="qnaService")
	private QnaMapper mapper;
	
	@Override
	public List<String> selectQnaList() throws Exception{
		return mapper.selectQnaList();
	}

	@Override
	public MemberVO selectQna(Map<String, Object> map) throws Exception {
		return mapper.selectQna(map);
	}





}

package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.QnaMapper;
import kr.or.profit.service.QnaService;
import kr.or.profit.vo.Criteria;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Resource(name = "qnaMapper")
	private QnaMapper mapper;

	//글 목록
	@Override
	public List<?> qnaList(Criteria cri) throws Exception {
		return mapper.qnaList(cri);
	}

	@Override
	public int qnaInsert(Map<String, Object> map) throws Exception {
		return mapper.qnaInsert(map);
	}

	@Override
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return mapper.qnaDetail(map);
	}

	@Override
	public int qnaUpdate(Map<String, Object> map) throws Exception {
		return mapper.qnaUpdate(map);
	}

	@Override
	public int qnaDelete(Map<String, Object> map) throws Exception {
		return mapper.qnaDelete(map);
	}

	//관리자 전용
	@Override
	public List<?> qnaListAll() throws Exception {
		return mapper.qnaListAll();
	}

	//댓글 등록
	@Override
	public int qnaReplyInsert(Map<String, Object> map) throws Exception{
		return mapper.qnaReplyInsert(map);
	}

	//댓글목록
	@Override
	public List<?> qnaDetailReply(Map<String, Object> map) throws Exception {
		System.out.println("댓글목록서비스옴 = " + map);
		return mapper.qnaDetailReply(map);
	}

	//댓글삭제
	@Override
	public int qnaReplyDelete(Map<String, Object> map) throws Exception {
		System.out.println("댓글삭제서비스옴 = " + map);
		return mapper.qnaReplyDelete(map);
	}

	//회원정보
	@Override
	public Map<String, Object> qnaDetailMember(Map<String, Object> map) throws Exception {
		System.out.println("회원정보 서비스옴 = " + map);
		return mapper.qnaDetailMember(map);
	}

	//대 댓글목록
	@Override
	public List<?> qnaDetailReplyList(Map<String, Object> map) throws Exception {
		System.out.println("회원정보 서비스옴 = " + map);
		return mapper.qnaDetailReplyList(map);
	}

	//대 댓글 등록
	@Override
	public int qnaReplyAdd(Map<String, Object> map) throws Exception {
		System.out.println("대 댓글 서비스옴 = " + map);
		return mapper.qnaReplyAdd(map);
	}

	//페이징
	@Override
	public int selectBoardCnt(Criteria cri) throws Exception {
		System.out.println("페이징옴 = " + cri);
		return mapper.selectBoardCnt(cri);
	}


}

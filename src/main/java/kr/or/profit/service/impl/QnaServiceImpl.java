package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.QnaMapper;
import kr.or.profit.service.QnaService;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Resource(name = "qnaMapper")
	private QnaMapper mapper;

	@Override
	public List<?> qnaList(Map<String, Object> map) throws Exception {
		return mapper.qnaList(map);
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
	public String qnaReplyInsert(Map<String, Object> map) throws Exception{
		return mapper.qnaReplyInsert(map);
	}





}

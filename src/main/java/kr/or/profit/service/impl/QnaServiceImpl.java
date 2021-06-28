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
	public List<?> qnaList() throws Exception {
		return mapper.qnaList();
	}

	@Override
	public int qnaInsert(Map<String, Object> map) throws Exception {
		System.out.println("서비스옴 = " + map);
		return mapper.qnaInsert(map);
	}





}

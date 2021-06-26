package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.MemberVO;

public interface QnaService {

	MemberVO selectQna(Map<String, Object> map) throws Exception;

//	QnaController과 연결만 해주고 QnaController에서 작업이 이루어진다. 
	List<String> selectQnaList() throws Exception;

}

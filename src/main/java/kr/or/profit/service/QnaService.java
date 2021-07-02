package kr.or.profit.service;

import java.util.List;
import java.util.Map;

public interface QnaService {

	List<?> qnaList(Map<String, Object> map) throws Exception;

	int qnaInsert(Map<String, Object> map) throws Exception;

	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;

	int qnaUpdate(Map<String, Object> map) throws Exception;

	int qnaDelete(Map<String, Object> map) throws Exception;

	//관리자전용
	List<?> qnaListAll() throws Exception;

	//댓글등록
	String qnaReplyInsert(Map<String, Object> map) throws Exception;

}

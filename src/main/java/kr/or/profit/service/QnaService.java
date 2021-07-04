package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {

	List<?> qnaList(Map<String, Object> map) throws Exception;

	int qnaInsert(Map<String, Object> map) throws Exception;

	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;

	int qnaUpdate(Map<String, Object> map) throws Exception;

	int qnaDelete(Map<String, Object> map) throws Exception;

	//관리자전용
	List<?> qnaListAll() throws Exception;

	//댓글등록
	int qnaReplyInsert(Map<String, Object> map) throws Exception;

	//댓글목록
	List<?> qnaDetailReply(Map<String, Object> map) throws Exception;

	//댓글삭제
	int qnaReplyDelete(HttpServletRequest request) throws Exception;

}

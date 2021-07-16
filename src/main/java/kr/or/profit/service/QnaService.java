package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.Criteria;

public interface QnaService {

	List<?> qnaList(Criteria cri) throws Exception;

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
	int qnaReplyDelete(Map<String, Object> map) throws Exception;

	Map<String, Object> qnaDetailMember(Map<String, Object> map) throws Exception;

	List<?> qnaDetailReplyList(Map<String, Object> map) throws Exception;

	int qnaReplyAdd(Map<String, Object> map) throws Exception;

	int selectBoardCnt(Criteria cri) throws Exception;


}

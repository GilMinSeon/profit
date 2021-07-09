package kr.or.profit.mapper;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

//Mapper Interface => 메서드명과 쿼리ID를 매핑하여 쿼리호출

@Mapper("qnaMapper")
public interface QnaMapper {

	List<?> qnaList() throws Exception;

	int qnaInsert(Map<String, Object>map) throws Exception;

	//상세보기
	Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception;

	int qnaUpdate(Map<String, Object> map) throws Exception;

	int qnaDelete(Map<String, Object> map) throws Exception;

	List<?> qnaListAll() throws Exception;

	//댓글 등록
	int qnaReplyInsert(Map<String, Object> map) throws Exception;

	//댓글 목록
	List<?> qnaDetailReply(Map<String, Object> map) throws Exception;

	//댓글 삭제
	int qnaReplyDelete(Map<String, Object> map) throws Exception;

	//로그인중인사람 정보
	Map<String, Object> qnaDetailMember(Map<String, Object> map) throws Exception;

	//대 댓글 목록
	List<?> qnaDetailReplyList(Map<String, Object> map) throws Exception;

	//대 댓글 등록
	int qnaReplyAdd(Map<String, Object> map) throws Exception;



}

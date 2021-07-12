package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.Criteria;


public interface TrainerPageService {

	//상담 리스트 조회
	List<Map<String, Object>> selectChatAccountList(Criteria cri) throws Exception;

	//상담 목록 전체 글 개수 조회
	int selectChatCnt(Criteria cri) throws Exception;
	
	//차트 
	Map<String, Object> selectChartInfo(String memberId) throws Exception;
	
	
}

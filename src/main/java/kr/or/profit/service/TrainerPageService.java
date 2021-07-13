package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.Criteria;


public interface TrainerPageService {

	//상담 정산 리스트 조회
	List<Map<String, Object>> selectChatAccountList(Criteria cri) throws Exception;

	//상담 정산 목록 전체 글 개수 조회
	int selectChatCnt(Criteria cri) throws Exception;
	
	//이용권 정산 차트 
	Map<String, Object> selectChartInfo(String memberId) throws Exception;
	
	//온라인 클래스 정산 리스트 조회
	List<Map<String, Object>> selectClassAccountList(Criteria cri) throws Exception;
	
	//온라인클래스 정산 목록 전체 글 개수 조회
	int selectClassCnt(Criteria cri) throws Exception;
	
	//온라인클래스 정산 차트
	Map<String, Object> selectChart2Info(String memberId) throws Exception;
	
	//트레이너 자신의 클래스 목록 조회
	List<Map<String, Object>> selectTrainerClassList(Criteria cri) throws Exception;
	
	//트레이너 자신의 클래스 목록 글 전체 개수
	int selectTrainerClassCnt(Criteria cri) throws Exception;
	
	
}

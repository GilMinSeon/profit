package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.Criteria;

public interface AdminChatService {

	//이용권 구매목록 조회
	List<Map<String, Object>> selectAdminChatList(Criteria cri) throws Exception;
	
	//페이징 - 이용권 구매목록 전체 글 개수
	public int selectAdminChatCnt(Criteria cri) throws Exception;

	//관리자 이용권조회리스트
	List<?> adminTicketPayList(Criteria cri) throws Exception;

	//관리자 이용권조회 리스트 전체 글 개수
	int adminTicketPayListCnt(Criteria cri) throws Exception;

	//관리자 이용권개수 수정
	int updTicketCnt(BuyTicketVO vo) throws Exception;
}

package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.ChatProfileVO;

public interface DietService {

	//선택한 이용권 정보 조회
	public Map<String, Object> selectTicketCategory(String ticketCategorySeq) throws Exception;	
	
	//구매한 이용권 정보 추가
	public int insertBuyTicket(BuyTicketVO vo) throws Exception;
	
	//사용가능한 이용권 존재여부 확인
	public int selectAvailableTicket(String memberId) throws Exception;

	//채팅 프로필 등록
	public int insertChatProfile(ChatProfileVO vo) throws Exception;
	
	//상담 프로필 등록 여부
	public int selectRegisterProfile(String memberId) throws Exception;
	
	//상담 프로필 목록 가져오기
	public List<Map<String, Object>> selectChatProflieList() throws Exception;
	
	//상담 프로필 사진 추가
	public int insertProcessFile(Map<String, Object> filemap) throws Exception;
	
}

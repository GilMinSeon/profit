package kr.or.profit.service;

import java.util.List;
import java.util.Map;

public interface DietService {

	//선택한 이용권 정보 조회
	public Map<String, Object> selectTicketCategory(String ticketCategorySeq) throws Exception;	

}

package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.Criteria;

public interface AdminChatService {

	//이용권 구매목록 조회
	List<Map<String, Object>> selectAdminChatList(Criteria cri) throws Exception;
	
	//페이징 - 이용권 구매목록 전체 글 개수
	public int selectAdminChatCnt(Criteria cri) throws Exception;
}

package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.CommunityMapper;
import kr.or.profit.mapper.DietMapper;
import kr.or.profit.service.CommunityService;
import kr.or.profit.service.DietService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.ChatProfileVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.LessonVO;
import kr.or.profit.vo.ReplyVO;

@Service("dietService")
public class DietServiceImpl implements DietService {
	
	@Resource(name= "dietMapper")
	private DietMapper dietDAO;
	

	//선택한 이용권 정보 조회
	@Override
	public Map<String, Object> selectTicketCategory(String ticketCategorySeq) throws Exception {
		return dietDAO.selectTicketCategory(ticketCategorySeq);
	}

	
	//구매한 이용권 정보 추가
	@Override
	public int insertBuyTicket(BuyTicketVO vo) throws Exception {
		return dietDAO.insertBuyTicket(vo);
	}
	
	//사용가능한 이용권 존재여부 확인
	@Override
	public int selectAvailableTicket(String memberId) throws Exception {
		return dietDAO.selectAvailableTicket(memberId);
	}


	//채팅 프로필 등록
	@Override
	public int insertChatProfile(ChatProfileVO vo) throws Exception {
		return dietDAO.insertChatProfile(vo);
	}

	//상담 프로필 등록 여부
	@Override
	public int selectRegisterProfile(String memberId) throws Exception {
		return dietDAO.selectRegisterProfile(memberId);
	}

	//상담 프로필 목록 가져오기
	@Override
	public List<Map<String, Object>> selectChatProflieList() throws Exception {
		return dietDAO.selectChatProflieList();
	}


	@Override
	public int insertProcessFile(Map<String, Object> filemap) throws Exception {
		return dietDAO.insertProcessFile(filemap);
	}
	


}

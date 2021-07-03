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


}

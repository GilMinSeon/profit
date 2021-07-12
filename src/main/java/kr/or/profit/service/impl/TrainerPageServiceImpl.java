package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.CommunityMapper;
import kr.or.profit.mapper.TrainerPageMapper;
import kr.or.profit.service.CommunityService;
import kr.or.profit.service.TrainerPageService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BookgoodVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonVO;
import kr.or.profit.vo.ReplyVO;

@Service("trainerPageService")
public class TrainerPageServiceImpl implements TrainerPageService {

	@Resource(name = "trainerPageMapper")
	private TrainerPageMapper trainerPageDAO;
	
	//상담목록 조회
	@Override
	public List<Map<String, Object>> selectChatAccountList(Criteria cri) throws Exception {
		return trainerPageDAO.selectChatAccountList(cri);
	}
	
	//상담 목록 전체 글 개수 조회
	@Override
	public int selectChatCnt(Criteria cri) throws Exception{
		return trainerPageDAO.selectChatCnt(cri);
	}

	//차트
	@Override
	public Map<String, Object> selectChartInfo(String memberId) throws Exception {
		return trainerPageDAO.selectChartInfo(memberId);
	}
	
	
}

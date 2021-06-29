package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.CommunityMapper;
import kr.or.profit.service.CommunityService;
import kr.or.profit.vo.CommunityVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Resource(name= "communityMapper")
	private CommunityMapper communityDAO;
	
	
	//자유게시판 글 등록
	@Override
	public int insertBoard(CommunityVO vo) throws Exception {
		return communityDAO.insertBoard(vo);
	}



	
	


	

}

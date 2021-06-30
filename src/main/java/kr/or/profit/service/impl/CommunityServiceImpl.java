package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.CommunityMapper;
import kr.or.profit.service.CommunityService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.LessonVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	
	@Resource(name= "communityMapper")
	private CommunityMapper communityDAO;
	
	
	//자유게시판 글 등록
	@Override
	public int insertBoard(CommunityVO vo) throws Exception {
		return communityDAO.insertBoard(vo);
	}

	
	//자유게시판 사진파일 추가
	@Override
	public int insertBoardFile(AttachFileVO vo) throws Exception {
		return communityDAO.insertBoardFile(vo);
	}

	
	//자유게시판 목록 조회
	@Override
	public List<Map<String, String>> selectBoardList() throws Exception {
		return communityDAO.selectBoardList();
	}

	
	//자유게시판 인기글 조회
	@Override
	public List<Map<String, String>> selectBoardTopList() throws Exception {
		return communityDAO.selectBoardTopList();
	}

	//자유게시판 상세글 조회
	@Override
	public Map<String, Object> selectBoardDetail(String communitySeq) throws Exception {
		return communityDAO.selectBoardDetail(communitySeq);
	}
	




	
	


	

}

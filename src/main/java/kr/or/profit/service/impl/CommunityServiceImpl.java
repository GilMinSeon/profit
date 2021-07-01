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
import kr.or.profit.vo.ReplyVO;

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

	//자유게시판 상세 댓글 나의 프로필 사진 조회
	@Override
	public String selectMyProfile(String memberId) throws Exception {
		return communityDAO.selectMyProfile(memberId);
	}
	
	//자유게시판 상세 댓글 추가
	@Override
	public int insertBoardReply(ReplyVO vo) throws Exception {
		return communityDAO.insertBoardReply(vo);
	}

	
	//댓글 리스트 가져오기
	@Override
	public List<Map<String, Object>> selectReplyList(String communitySeq) throws Exception {
		return communityDAO.selectReplyList();
	}
	




	
	


	

}

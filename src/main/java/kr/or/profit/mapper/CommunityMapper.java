package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.ReplyVO;

@Mapper("communityMapper")
public interface CommunityMapper {

	//자유게시판 글 등록
	int insertBoard(CommunityVO vo) throws Exception;
	
	//자유게시판 사진파일 추가
	int insertBoardFile(AttachFileVO vo) throws Exception;
	
	//자유게시판 목록 조회
	List<Map<String, String>> selectBoardList() throws Exception;
	
	//자유게시판 인기글 목록 조회
	List<Map<String, String>> selectBoardTopList() throws Exception;
	
	//자유게시판 상세글 조회
	Map<String, Object> selectBoardDetail(String communitySeq) throws Exception;
	
	//자유게시판 상세 댓글 나의 프로필 사진 조회
	String selectMyProfile(String memberId) throws Exception;
	
	//자유게시판 상세 댓글 추가
	int insertBoardReply(ReplyVO vo) throws Exception;
	
	//댓글리스트 가져오기
	List<Map<String, Object>> selectReplyList() throws Exception;
	
}

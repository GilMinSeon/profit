package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import org.antlr.grammar.v3.ANTLRParser.throwsSpec_return;

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
	
	//자유게시판 댓글리스트 가져오기
	List<Map<String, Object>> selectReplyList(String communitySeq) throws Exception;
	
	//자유게시판 답글 추가
	int insertBoardRereply(ReplyVO vo) throws Exception;
	
	//자유게시판 댓글 삭제
	int deleteBoardReply(String replySeq) throws Exception;
	
	//자유게시판 조회수 증가
	int increaseHit(String communitySeq) throws Exception;
	
	//자유게시판 글 수정
	int updateBoard(CommunityVO vo) throws Exception;
	
	//자유게시판 글 삭제
	int deleteBoard(String communitySeq) throws Exception;
	
	//최신글 TOP5 가져오기
	List<Map<String,Object>> recentBoardList() throws Exception;
	
	//인기글 TOP5 가져오기
	List<Map<String,Object>> bestBoardList() throws Exception;
}

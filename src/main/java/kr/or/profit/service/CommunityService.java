package kr.or.profit.service;

import java.util.Map;

import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.CommunityVO;

public interface CommunityService {


	//자유게시판 글 등록
	public int insertBoard(CommunityVO vo) throws Exception;
	
	//자유게시판 사진파일 추가
	public int insertBoardFile(AttachFileVO vo) throws Exception;

}

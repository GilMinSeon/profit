package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.CommunityVO;

@Mapper("communityMapper")
public interface CommunityMapper {

	//자유게시판 글 등록
	int insertBoard(CommunityVO vo) throws Exception;
	
	//자유게시판 사진파일 추가
	int insertBoardFile(AttachFileVO vo) throws Exception;
	

	
}

package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import org.antlr.grammar.v3.ANTLRParser.throwsSpec_return;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.Criteria;

@Mapper("trainerPageMapper")
public interface TrainerPageMapper {

	//상담 목록 조회
	List<Map<String, Object>> selectChatAccountList(Criteria cri) throws Exception;
	
	//상담 목록 전체 글 개수 조회
	int selectChatCnt(Criteria cri) throws Exception;
	
	//차트
	Map<String, Object> selectChartInfo(String memberId) throws Exception;
	
}

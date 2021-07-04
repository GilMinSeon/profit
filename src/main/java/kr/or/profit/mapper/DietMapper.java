package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import org.antlr.grammar.v3.ANTLRParser.throwsSpec_return;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.ReplyVO;

@Mapper("dietMapper")
public interface DietMapper {

	//선택한 이용권 정보 조회
	Map<String, Object> selectTicketCategory(String ticketCategorySeq) throws Exception;
}
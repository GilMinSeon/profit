package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import org.antlr.grammar.v3.ANTLRParser.throwsSpec_return;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.ChatProfileVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.ReplyVO;

@Mapper("dietMapper")
public interface DietMapper {

	//선택한 이용권 정보 조회
	Map<String, Object> selectTicketCategory(String ticketCategorySeq) throws Exception;
	
	//구매한 이용권 정보 추가
	int insertBuyTicket(BuyTicketVO vo) throws Exception;
	
	//사용가능한 이용권 존재여부 확인
	int selectAvailableTicket(String memberId) throws Exception;
	
	//채팅 프로필 등록
	int insertChatProfile(ChatProfileVO vo) throws Exception;
	
	//상담 프로필 등록 여부
	int selectRegisterProfile(String memberId) throws Exception;
	
	//상담 프로필 목록 가져오기
	List<Map<String, Object>> selectChatProflieList() throws Exception;
	
	int insertProcessFile(Map<String, Object> filemap) throws Exception;
}
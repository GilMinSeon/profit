package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.BuyTicketVO;
import kr.or.profit.vo.Criteria;


@Mapper("adminChatMapper")
public interface AdminChatMapper {

	public List<Map<String, Object>> selectAdminChatList(Criteria cri);

	public int selectAdminChatCnt(Criteria cri);

	//관리자 이용권조회리스트
	public List<?> adminTicketPayList(Criteria cri) throws Exception ;

	//관리자 이용권조회 리스트 전체 글 개수 
	public int adminTicketPayListCnt(Criteria cri) throws Exception;

	//관리자 이용권개수 수정
	public int updTicketCnt(BuyTicketVO vo) throws Exception;

}

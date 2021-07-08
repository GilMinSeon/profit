package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.Criteria;


@Mapper("adminChatMapper")
public interface AdminChatMapper {

	public List<Map<String, Object>> selectAdminChatList(Criteria cri);

	public int selectAdminChatCnt(Criteria cri);

}

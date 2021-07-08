package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.ProcessVO;

@Mapper("adminMemberMapper")
public interface AdminMemberMapper {
	
	//관리자-트레이너승인, 숫자 보여주는 표
	public ProcessVO selectProcessNumberList();
	
	//관리자-트레이너승인, 리스트 부분
	public List<Map<String, Object>> selectProcessList(Criteria cri);
	
	//페이징용 전체 수 cnt
	public int selectProcessListCnt(Criteria cri);

}

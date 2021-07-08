package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.ProcessVO;

public interface AdminMemberService {
	//관리자-트레이너승인, 숫자 보여주는 표
	public ProcessVO selectProcessNumberList() throws Exception;
	
	//관리자-트레이너승인, 리스트 부분
	public List<Map<String, Object>> selectProcessList(Criteria cri) throws Exception;
	
	//페이징용 전체 수 cnt
	public int selectProcessListCnt(Criteria cri) throws Exception;
}

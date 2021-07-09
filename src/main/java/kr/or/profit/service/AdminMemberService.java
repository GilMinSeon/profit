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
	
	//검토단계로 update
	public int updateStatusB(String processSeq) throws Exception;
	
	//트레이너 프로세스 디테일
	public ProcessVO selectProcessDetailBySeq(String processSeq) throws Exception;
	
	//첨부파일 가져오기
	public List<?> selectProcessFile(String fileSeq) throws Exception;
	
}

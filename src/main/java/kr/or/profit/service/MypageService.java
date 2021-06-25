package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.ProcessVO;

public interface MypageService {
	
	//회원기본정보조회
	public List<Map<String, String>> selectMemberInfo(String memberId) throws Exception;
	
	//프로세스정보추가
	public int insertProcess(ProcessVO vo) throws Exception;
}

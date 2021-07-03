package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.MemberVO;
import kr.or.profit.vo.ProcessVO;

public interface MypageService {
	
	//회원기본정보조회
	public List<Map<String, String>> selectMemberInfo(String memberId) throws Exception;
	
	//프로세스정보추가
	public int insertProcess(ProcessVO vo) throws Exception;
	
	//파일 추가
	public int insertProcessFile(Map map) throws Exception;
	
	
	
	//민선 
	//회원 모든 정보 select
	public MemberVO selectAllMemberInfo(String memberId) throws Exception;
	//내정보 수정
	public void updateMemberInfo(MemberVO vo) throws Exception;
	
	
	public int updateOnlyInfo(MemberVO vo) throws Exception;
	
	public ProcessVO selectProcessInfo(String memberId) throws Exception;
	
	
	public List<?> selectFileInfo(String fileSeq) throws Exception;
	
	public int checkApplyPage(String memberId) throws Exception;
	
}

package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.MemberVO;
import kr.or.profit.vo.ProcessVO;

//Mapper Interface => 메서드명과 쿼리ID를 매핑하여 쿼리호출

@Mapper("mypageMapper")
public interface MypageMapper {
	//회원기본정보조회
	public List<Map<String, String>> selectMemberInfo(String memberId);
	
	//프로세스정보추가
	public int insertProcess(ProcessVO vo);
	
	//파일추가
	public int insertProcessFile(Map map);
	
	
	
	
	
	//민선
	//회원 모든 정보 select
	public MemberVO selectAllMemberInfo(String memberId);
	
	public void updateMemberInfo(MemberVO vo);
	
	public int updateOnlyInfo(MemberVO vo);
	
	//
	public ProcessVO selectProcessInfo(String memberId);
	
	public List<?> selectFileInfo(String fileSeq);
	
	public int checkApplyPage(String memberId);
	
	
}

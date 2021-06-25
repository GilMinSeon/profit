package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.ProcessVO;

//Mapper Interface => 메서드명과 쿼리ID를 매핑하여 쿼리호출

@Mapper("mypageMapper")
public interface MypageMapper {
	//회원기본정보조회
	public List<Map<String, String>> selectMemberInfo(String memberId);
	
	//프로세스정보추가
	public int insertProcess(ProcessVO vo);
	
	//파일추가
	public int insertProcessFile(List list);
}

package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

//Mapper Interface => 메서드명과 쿼리ID를 매핑하여 쿼리호출

@Mapper("mypageMapper")
public interface MypageMapper {
	//회원기본정보조회
	public List<Map<String, String>> selectMemberInfo(String memberId);
}

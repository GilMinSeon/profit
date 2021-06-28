package kr.or.profit.mapper;


import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

//Mapper Interface => 메서드명과 쿼리ID를 매핑하여 쿼리호출

@Mapper("qnaMapper")
public interface QnaMapper {

	List<?> qnaList() throws Exception;

	int qnaInsert(Map<String, Object>map) throws Exception;


}

package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.Criteria;


@Mapper("adminLessonMapper")
public interface AdminLessonMapper {

	//관리자 - 온라인클래스 강좌 리스트
	List<?> selectAdminLessonList(Criteria cri) throws Exception;

	public int selectAdminLessonCnt(Criteria cri) throws Exception;

	

}

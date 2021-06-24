package kr.or.profit.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {

	/**
	 * 강의 등록
	 */
	void insertLesson(LessonVO vo) throws Exception;

	
}

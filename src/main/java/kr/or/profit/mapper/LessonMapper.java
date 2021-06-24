package kr.or.profit.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {

	//강의 등록
	int insertLesson(LessonVO vo) throws Exception;

	//강의 수정
	int updateLesson(LessonVO vo) throws Exception;

	


	
}

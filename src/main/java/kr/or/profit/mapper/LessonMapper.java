package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {

	//강의 등록
	int insertLesson(LessonVO vo) throws Exception;

	//강의 수정
//	int updateLesson(LessonVO vo) throws Exception;

	//강의 목록 조회
	List<?> selectLessonList() throws Exception;

	//강의 상세조회
//	List<?> selectLessonDetail(String lessonSeq) throws Exception;

//	List<?> selectLessonDetail(LessonVO vo) throws Exception;
	List<?> selectLessonDetail(String lessonSeq) throws Exception;

//	Map<String, Object> selectLessonDetail(Map<String, Object> map) throws Exception;


	


	
}

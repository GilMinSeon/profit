package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.LessonVO;

@Mapper("lessonMapper")
public interface LessonMapper {

	//강의 등록
	int insertLesson(LessonVO vo) throws Exception;

	//강의 수정
	int updateLesson(LessonVO vo) throws Exception;
	
	//강의 목록 조회
	List<?> selectLessonList() throws Exception;

	//강의 상세조회
	Map<String, Object> selectLessonDetail(LessonVO vo) throws Exception;

	//강의 삭제(비활성화 여부)
	int deleteLesson(LessonVO vo) throws Exception;

	//강의 파일 추가

	int insertLessonFile(Map map) throws Exception;

	//강의 파일 수정
	int updateLessonFile(Map map) throws Exception;

	//인기강의 조회
	List<?> selectTopLessonList() throws Exception;


	
	

	


	


	
}

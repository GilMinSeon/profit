package kr.or.profit.service;

import java.util.List;

import kr.or.profit.vo.LessonVO;

public interface LessonService {


	//강의등록
	public int insertLesson(LessonVO lessonVO) throws Exception;

	//강의수정
//	public int updateLesson(LessonVO lessonVO) throws Exception;
	
	//강의 목록조회 ->나중에 페이징처리하기
	public List<?> selectLessonList() throws Exception;


	
	
}

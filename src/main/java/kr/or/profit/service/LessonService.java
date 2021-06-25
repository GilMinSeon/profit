package kr.or.profit.service;

import kr.or.profit.vo.LessonVO;

public interface LessonService {


	//강의등록
	public int insertLesson(LessonVO lessonVO) throws Exception;

	//강의수정
	public int updateLesson(LessonVO lessonVO) throws Exception;


	
	
}

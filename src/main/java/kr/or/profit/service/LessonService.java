package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.LessonDetailVO;
import kr.or.profit.vo.LessonVO;

public interface LessonService {


	//강의등록
	public int insertLesson(LessonVO vo) throws Exception;

	//강의 목록조회 ->나중에 페이징처리하기
	public List<?> selectLessonList(Map<String, Object> map) throws Exception;

	//강의 상세조회
	public Map<String, Object> selectLessonDetail(LessonVO lessonVO) throws Exception;

	//강의수정
	public int updateLesson(LessonVO lessonVO) throws Exception;

	//강의 삭제
	public int deleteLesson(LessonVO lessonVO) throws Exception;


	//강의 파일 추가
	public int insertLessonFile(Map map) throws Exception;

	//강의 파일 수정
	public int updateLessonFile(Map map) throws Exception;

	//인기강의 조회
	public List<?> selectTopLessonList()throws Exception;

	//상세 강의 파일등록
	public int insertClassFile(Map map) throws Exception;

	//상세 강의 등록
	public int insertClass(LessonDetailVO vo) throws Exception;

	//상세강의 목록조회
	public List<?> selectClassList(String lessonSeq) throws Exception;

	//상세강의 디테일조회
	public Map<String, Object> selectclassDetail(LessonDetailVO lDetailVO) throws Exception;

	//상세강의 삭제
	public int deleteClass(LessonDetailVO vo) throws Exception;
	
	//카테고리 선택하면 리스트
	public List<?> selectCateLessonList(Map<String, Object> map) throws Exception;

	public List<?> selectLessonList() throws Exception;




	
	
}

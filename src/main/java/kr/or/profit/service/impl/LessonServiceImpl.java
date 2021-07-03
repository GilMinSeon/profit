package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.LessonMapper;
import kr.or.profit.service.LessonService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.LessonDetailVO;
import kr.or.profit.vo.LessonVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {
	
	@Resource(name= "lessonMapper")
	private LessonMapper lessonDAO;
	
	
	//강의 등록
	@Override
	public int insertLesson(LessonVO vo) throws Exception {
		return  lessonDAO.insertLesson(vo);
	}

	//강의 수정
	@Override
	public int updateLesson(LessonVO vo) throws Exception {
		return lessonDAO.updateLesson(vo);
	}

	//강의 목록조회
	@Override
	public List<?> selectLessonList(Map<String, Object> map) throws Exception {
		return lessonDAO.selectLessonList(map);
	}

	//강의 상세조회
	@Override
	public Map<String, Object> selectLessonDetail(LessonVO vo) throws Exception {
		return lessonDAO.selectLessonDetail(vo);
	}

	//강의 삭제(비활성화여부)
	@Override
	public int deleteLesson(LessonVO vo) throws Exception {
		return lessonDAO.deleteLesson(vo);
		
	}

	//강의 파일 추가
	@Override
	public int insertLessonFile(Map map) throws Exception {
		return lessonDAO.insertLessonFile(map);
	}

	//강의 파일 수정
	@Override
	public int updateLessonFile(Map map) throws Exception {
		return lessonDAO.updateLessonFile(map);
	}

	//인기강의 조회
	@Override
	public List<?> selectTopLessonList() throws Exception {
		return lessonDAO.selectTopLessonList();
	}

	//상세 강의 파일등록
	@Override
	public int insertClassFile(Map map) throws Exception {
		return lessonDAO.insertClassFile(map);
	}

	//상세 강의 등록
	@Override
	public int insertClass(LessonDetailVO vo) throws Exception {
		return  lessonDAO.insertClass(vo);
		
	}

	//상세강의 목록 조회
	@Override
	public List<?> selectClassList(String lessonSeq) throws Exception {
		return lessonDAO.selectClassList(lessonSeq);
	}

	//상세강의 디테일 조회
	@Override
	public Map<String, Object> selectclassDetail(LessonDetailVO vo) throws Exception {
		return lessonDAO.selectclassDetail(vo);
	}

	//상세강의 삭제
	@Override
	public int deleteClass(LessonDetailVO vo) throws Exception {
		return lessonDAO.deleteClass(vo);
	}

	//카테고리 선택하면 리스트
	@Override
	public List<?> selectCateLessonList(Map<String, Object> map) throws Exception {
		return lessonDAO.selectCateLessonList(map);
	}

	@Override
	public List<?> selectLessonList() throws Exception {
		return lessonDAO.selectLessonList();
	}



	
	


	

}

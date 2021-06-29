package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.LessonMapper;
import kr.or.profit.service.LessonService;
import kr.or.profit.vo.AttachFileVO;
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
	public List<?> selectLessonList() throws Exception {
		return lessonDAO.selectLessonList();
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



	
	


	

}

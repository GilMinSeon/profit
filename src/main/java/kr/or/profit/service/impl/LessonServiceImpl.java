package kr.or.profit.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.AttachFileMapper;
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

	

}

package kr.or.profit.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.LessonMapper;
import kr.or.profit.service.LessonService;
import kr.or.profit.vo.LessonVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {
	
	@Resource(name= "lessonMapper")
	private LessonMapper lessonDAO;
	
	@Override
	public void insertLesson(LessonVO vo) throws Exception {
		
		lessonDAO.insertLesson(vo);
		
	}

}

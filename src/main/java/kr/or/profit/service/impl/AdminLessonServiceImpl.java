package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.AdminLessonMapper;
import kr.or.profit.mapper.AdminMemberMapper;
import kr.or.profit.service.AdminLessonService;
import kr.or.profit.service.AdminMemberService;
import kr.or.profit.vo.BuyLessonVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonVO;
import kr.or.profit.vo.ProcessVO;

@Service("adminLessonService")
public class AdminLessonServiceImpl implements AdminLessonService {

	@Resource(name = "adminLessonMapper")
	private AdminLessonMapper adminLessonDAO;

	//관리자 - 온라인클래스 강좌 리스트
	@Override
	public List<?> selectAdminLessonList(Criteria cri) throws Exception {
		return adminLessonDAO.selectAdminLessonList(cri);
	}

	//페이징 - 온라인클래스 목록 개수
	@Override
	public int selectAdminLessonCnt(Criteria cri) throws Exception {
		return adminLessonDAO.selectAdminLessonCnt(cri);
	}

	//관리자 강의 상태업데이트
	@Override
	public int updAdminLesson(LessonVO vo) throws Exception {
		return adminLessonDAO.updAdminLesson(vo);
	}

	//refund_flag위한 리스트
	@Override
	public List<?> selectList(String lessonSeq) throws Exception {
		return adminLessonDAO.selectList(lessonSeq);
	}

	//관리자 비활성화 환불
	@Override
	public int updAdminRefund(BuyLessonVO buyvo) throws Exception {
		return adminLessonDAO.updAdminRefund(buyvo);
	}

	
	
	


}

package kr.or.profit.service;

import java.util.List;

import kr.or.profit.vo.BuyLessonVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonVO;

public interface AdminLessonService {

	//관리자 - 온라인클래스 강좌 리스트
	List<?> selectAdminLessonList(Criteria cri) throws Exception;

	//페이징- 온라인클래스 목록 전체 글 개수
	public int selectAdminLessonCnt(Criteria cri) throws Exception;

	//관리자 강의 상태업데이트
	int updAdminLesson(LessonVO vo) throws Exception;

	//refund_flag위한 리스트
	List<?> selectList(String lessonSeq) throws Exception;

	//관리자 비활성화 환불
	int updAdminRefund(BuyLessonVO buyvo) throws Exception;


}

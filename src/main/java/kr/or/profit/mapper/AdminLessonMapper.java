package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.BuyLessonVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonVO;


@Mapper("adminLessonMapper")
public interface AdminLessonMapper {

	//관리자 - 온라인클래스 강좌 리스트
	List<?> selectAdminLessonList(Criteria cri) throws Exception;

	public int selectAdminLessonCnt(Criteria cri) throws Exception;

	//관리자 강의 상태업데이트
	int updAdminLesson(LessonVO vo) throws Exception;

	//refund_flag위한 리스트
	List<?> selectList(String lessonSeq) throws Exception;

	//관리자 비활성화 환불
	int updAdminRefund(BuyLessonVO buyvo)  throws Exception;

	

}

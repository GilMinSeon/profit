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

	//관리자가보는 온라인클래스 결제/환불 리스트
	@Override
	public List<?> adminLessonPayList(Criteria cri) throws Exception {
		return adminLessonDAO.adminLessonPayList(cri);
	}

	//온라인클래스 결제/환불내역 전체 글개수
	@Override
	public int adminLessonPayListCnt(Criteria cri) throws Exception {
		return adminLessonDAO.adminLessonPayListCnt(cri);
	}
	
	//온라인 클래스 최근 7일 수익
	@Override
	public Map<String, Object> lessonPriceDays() throws Exception{
		return adminLessonDAO.lessonPriceDays();
	}
	
	//온라인 클래스 최근 7일 수익(남자)
	@Override
	public Map<String, Object> lessonPriceDaysM() throws Exception {
		return adminLessonDAO.lessonPriceDaysM();
	}
	
	//온라인 클래스 최근 7일 수익(여자)
	@Override
	public Map<String, Object> lessonPriceDaysF() throws Exception {
		return adminLessonDAO.lessonPriceDaysF();
	}

	//온라인 클래스 최근 5주 수익
	@Override
	public Map<String, Object> lessonPriceWeeks() throws Exception {
		return adminLessonDAO.lessonPriceWeeks();
	}
	
	//온라인 클래스 최근 5주 수익(남자)
	@Override
	public Map<String, Object> lessonPriceWeeksM() throws Exception {
		return adminLessonDAO.lessonPriceWeeksM();
	}
	
	//온라인 클래스 최근 5주 수익(여자)
	@Override
	public Map<String, Object> lessonPriceWeeksF() throws Exception {
		return adminLessonDAO.lessonPriceWeeksF();
	}
	
	//온라인 클래스 최근 6개월 수익
	@Override
	public Map<String, Object> lessonPriceMonths() throws Exception {
		return adminLessonDAO.lessonPriceMonths();
	}
	
	//온라인 클래스 최근 6개월 수익(남자)
	@Override
	public Map<String, Object> lessonPriceMonthsM() throws Exception {
		return adminLessonDAO.lessonPriceMonthsM();
	}

	//온라인 클래스 최근 6개월 수익(여자)
	@Override
	public Map<String, Object> lessonPriceMonthsF() throws Exception {
		return adminLessonDAO.lessonPriceMonthsF();
	}

	//신규강좌(일주일) 구매 TOP5
	@Override
	public List<Map<String,Object>> newTop5() throws Exception {
		return adminLessonDAO.newTop5();
	}
	
	//카테고리별 신규강좌 등록 비율
	@Override
	public Map<String, Object> newRegister() throws Exception {
		return adminLessonDAO.newRegister();
	}
	
	//최근 일주일 신규강좌 등록 수
	@Override
	public Map<String, Object> newRegisterCount() throws Exception {
		return adminLessonDAO.newRegisterCount();
	}
	
	//누적 북마크순
	@Override
	public List<Map<String,Object>> bookmarkRank() throws Exception {
		return adminLessonDAO.bookmarkRank();
	}
	
	//누적 좋아요순
	@Override
	public List<Map<String, Object>> goodRank() throws Exception {
		return adminLessonDAO.goodRank();
	}
	
	//누적 인기강좌 순위
	@Override
	public List<Map<String, Object>> lessonRank() throws Exception {
		return adminLessonDAO.lessonRank();
	}
	
	
	

}

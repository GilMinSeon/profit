package kr.or.profit.service;

import java.util.List;

import kr.or.profit.vo.Criteria;

public interface AdminLessonService {

	//관리자 - 온라인클래스 강좌 리스트
	List<?> selectAdminLessonList(Criteria cri) throws Exception;

	//페이징- 온라인클래스 목록 전체 글 개수
	public int selectAdminLessonCnt(Criteria cri) throws Exception;


}

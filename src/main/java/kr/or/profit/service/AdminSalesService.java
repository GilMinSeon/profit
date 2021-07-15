package kr.or.profit.service;

import java.util.List;

import kr.or.profit.vo.Criteria;

public interface AdminSalesService {

	//관리자가보는 정산하기 리스트
	List<?> selectAdminSales(Criteria cri) throws Exception;

	//전체 글 개수
	int selectAdminSalesCnt(Criteria cri) throws Exception;

	//관리자가보는 정산하기 상세 리스트
	List<?> selectAdminSalesDetail(Criteria cri) throws Exception;

	//정산하기 상세 리스트 전체 글 개수 세팅
	int selectAdminSalesDetailCnt(Criteria cri) throws Exception;



}

package kr.or.profit.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.AdminSalesMapper;
import kr.or.profit.service.AdminSalesService;
import kr.or.profit.vo.Criteria;


@Service("adminSalesService")
public class AdminSalesServiceImpl implements AdminSalesService {

	@Resource(name = "adminSalesMapper")
	private AdminSalesMapper adminSalesDAO;

	//관리자가보는 정산하기 리스트
	@Override
	public List<?> selectAdminSales(Criteria cri) throws Exception {
		return adminSalesDAO.selectAdminSales(cri);
	}

	//전체 글 개수
	@Override
	public int selectAdminSalesCnt(Criteria cri) throws Exception {
		return adminSalesDAO.selectAdminSalesCnt(cri);
	}

	//관리자가보는 정산하기 상세 리스트
	@Override
	public List<?> selectAdminSalesDetail(Criteria cri) throws Exception {
		return adminSalesDAO.selectAdminSalesDetail(cri);
	}

	//정산하기 상세 리스트 전체 글 개수 세팅
	@Override
	public int selectAdminSalesDetailCnt(Criteria cri) throws Exception {
		return adminSalesDAO.selectAdminSalesDetailCnt(cri);
	}

	

	


}

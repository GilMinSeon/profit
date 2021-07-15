package kr.or.profit.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.AdminSalesMapper;
import kr.or.profit.service.AdminSalesService;


@Service("adminSalesService")
public class AdminSalesServiceImpl implements AdminSalesService {

	@Resource(name = "adminSalesMapper")
	private AdminSalesMapper adminSalesDAO;

	

	


}

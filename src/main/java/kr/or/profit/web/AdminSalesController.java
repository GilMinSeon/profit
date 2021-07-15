package kr.or.profit.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.profit.service.AdminSalesService;

@Controller
public class AdminSalesController {
	@Resource(name = "adminSalesService")
	private  AdminSalesService adminSalesService;
	
	@RequestMapping(value = "adminSalesList.do", method = RequestMethod.GET)
	public String adminSalesList() throws Exception{
		return "adminSales/adminSalesList";
	}
	
	@RequestMapping(value = "adminSalesDetail.do", method = RequestMethod.GET)
	public String adminSalesDetail() throws Exception{
		return "adminSales/adminSalesDetail";
	}
	

}
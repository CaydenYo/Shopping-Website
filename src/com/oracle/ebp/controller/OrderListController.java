package com.oracle.ebp.controller;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.ebp.domain.OrderList;
import com.oracle.ebp.exception.OrderListException;
import com.oracle.ebp.service.OrderListService;

@Controller
@RequestMapping(value = "orderlist")
public class OrderListController {

	@Resource
	OrderListService orderlistSvc;
	
	//显示订单详情
	@RequestMapping(value = "/queryAllOrderList",method = {RequestMethod.POST,RequestMethod.GET})
	public String showUserOrderList(int oid,HttpSession session) throws OrderListException{
		List<OrderList> showuserorderlist = new LinkedList<>();
		showuserorderlist.addAll(orderlistSvc.showUserOrderList(oid));
		for(int i = 0;i < showuserorderlist.size();i++) {
			System.out.println(showuserorderlist.get(i));
		}
		session.setAttribute("userorderdetails", showuserorderlist);
		System.out.println("已执行数据库语句");
		return "/user/OrderDetails";
	}
	
	
}

package com.oracle.ebp.controller;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderList;
import com.oracle.ebp.domain.OrderListBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.OrderException;
import com.oracle.ebp.exception.OrderListException;
import com.oracle.ebp.service.OrderListService;
import com.oracle.ebp.service.OrderService;
import com.oracle.ebp.util.tools.WebTool;

@Controller
@RequestMapping(value = "order")
public class OrderController {
	
		@Resource
		OrderService orderSvc;
		
		@Resource
		OrderListService orderlistSvc;
		
		
		//查询个人订单函数
		@RequestMapping(value = "/queryUserOrders", method = RequestMethod.GET)
		public String listUserOrders(HttpSession session) throws OrderException{
			List<Order> listuserorders = new LinkedList<>();
			//获取已登录的用户
			User user = (User)session.getAttribute("session_user");
			int uid = user.getUid();
			System.out.println(uid);
			listuserorders.addAll(orderSvc.listUserOrders(uid));
			session.setAttribute("listallorders",listuserorders);
			System.out.println("已放入session作用域中");
			return "user/ShowOrders";
		}
		
		//获得最新插入的订单
		@RequestMapping(value = "/getLatestOrder",method = RequestMethod.GET)
		public String getLatestOrder(HttpSession session) throws OrderException, OrderListException{
			List<Order> listuserorders = new LinkedList<>();
			//获取已登录的用户
			User user = (User)session.getAttribute("session_user");
			int uid = user.getUid();
			System.out.println(uid);
			//获得用户订单列表
			listuserorders.addAll(orderSvc.listUserOrders(uid));
			//获得用户总订单数
			int index = listuserorders.size();
			System.out.println(index);
			//获得最新的订单
			Order latestOrder = listuserorders.get(index - 1);
			session.setAttribute("latestorder", latestOrder);
			System.out.println(latestOrder);
			//获得最新订单的id
			int latestOrderId = latestOrder.getOid();
			System.out.println(latestOrderId);
			//根据oid查询相应的订单详情
			List<OrderList> showuserorderlist = new LinkedList<>();
			showuserorderlist.addAll(orderlistSvc.showUserOrderList(latestOrderId));
			session.setAttribute("latestorderlist", showuserorderlist);
			return "user/ShoppingSuccess";
		}
		
		//查询全部用户的订单
		@RequestMapping(value = "/queryAllOrders",method = RequestMethod.GET)
		public String queryAllOrders(HttpSession session) throws OrderException{
			List<Order> queryAllOrders = new LinkedList<>();
			queryAllOrders.addAll(orderSvc.queryAllOrders());
			session.setAttribute("listallorders",queryAllOrders);
			return "admin/ShowAllOrder";
		}
		
		//根据订单号、姓名、身份证查询订单
		@RequestMapping(value = "/GetUserByAdmin_oni", method = {RequestMethod.POST,RequestMethod.GET})
		public String queryOrdersByCondition(Integer soid,String sname, String sidCard,HttpSession session) throws OrderException{
			System.out.println("oid = " + soid + "sname = " + sname + " idCard = " + sidCard);
			List<Order> listorderbycondition = new LinkedList<>();
			listorderbycondition.addAll(orderSvc.queryOrdersByCondition(soid,sname,sidCard));
			for(int i = 0;i < listorderbycondition.size();i++) {
				System.out.println(listorderbycondition.get(i));
			}
			System.out.println("已执行sql");
			session.setAttribute("listallorders",listorderbycondition);
			System.out.println("已将查到的结果注入session作用域");
			return "admin/ShowAllOrder";
		}
		
		//根据订单生成时间查询订单
		@RequestMapping(value = "/queryOrderByDate",method = {RequestMethod.POST,RequestMethod.GET})
		public String queryOrderByDate(String begin,String end,HttpSession session) throws OrderException{
			System.out.println("start = " + begin + " end = " + end);
			Date startTime = new Date(0);
			Date endTime = new Date(0);
			if(begin == null || begin.trim().equals("")) {
				startTime = WebTool.getBeforeDate(WebTool.getCurrentDate());
			}
			if(end == null || end.trim().equals("")) {
				endTime = WebTool.getCurrentDate();
			}
			else {
				startTime = Date.valueOf(begin);
				endTime= Date.valueOf(end);
			}
			System.out.println("startTime = " + startTime + " endTime = " + endTime);
			List<Order> listorderbydate = new LinkedList<>();
			listorderbydate.addAll(orderSvc.queryOrdersByDate(startTime,endTime));
			System.out.println("已执行sql语句");
			session.setAttribute("listallorders", listorderbydate);
			return "admin/ShowAllOrder";
		}
}

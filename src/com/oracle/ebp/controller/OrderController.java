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
		
		
		//��ѯ���˶�������
		@RequestMapping(value = "/queryUserOrders", method = RequestMethod.GET)
		public String listUserOrders(HttpSession session) throws OrderException{
			List<Order> listuserorders = new LinkedList<>();
			//��ȡ�ѵ�¼���û�
			User user = (User)session.getAttribute("session_user");
			int uid = user.getUid();
			System.out.println(uid);
			listuserorders.addAll(orderSvc.listUserOrders(uid));
			session.setAttribute("listallorders",listuserorders);
			System.out.println("�ѷ���session��������");
			return "user/ShowOrders";
		}
		
		//������²���Ķ���
		@RequestMapping(value = "/getLatestOrder",method = RequestMethod.GET)
		public String getLatestOrder(HttpSession session) throws OrderException, OrderListException{
			List<Order> listuserorders = new LinkedList<>();
			//��ȡ�ѵ�¼���û�
			User user = (User)session.getAttribute("session_user");
			int uid = user.getUid();
			System.out.println(uid);
			//����û������б�
			listuserorders.addAll(orderSvc.listUserOrders(uid));
			//����û��ܶ�����
			int index = listuserorders.size();
			System.out.println(index);
			//������µĶ���
			Order latestOrder = listuserorders.get(index - 1);
			session.setAttribute("latestorder", latestOrder);
			System.out.println(latestOrder);
			//������¶�����id
			int latestOrderId = latestOrder.getOid();
			System.out.println(latestOrderId);
			//����oid��ѯ��Ӧ�Ķ�������
			List<OrderList> showuserorderlist = new LinkedList<>();
			showuserorderlist.addAll(orderlistSvc.showUserOrderList(latestOrderId));
			session.setAttribute("latestorderlist", showuserorderlist);
			return "user/ShoppingSuccess";
		}
		
		//��ѯȫ���û��Ķ���
		@RequestMapping(value = "/queryAllOrders",method = RequestMethod.GET)
		public String queryAllOrders(HttpSession session) throws OrderException{
			List<Order> queryAllOrders = new LinkedList<>();
			queryAllOrders.addAll(orderSvc.queryAllOrders());
			session.setAttribute("listallorders",queryAllOrders);
			return "admin/ShowAllOrder";
		}
		
		//���ݶ����š����������֤��ѯ����
		@RequestMapping(value = "/GetUserByAdmin_oni", method = {RequestMethod.POST,RequestMethod.GET})
		public String queryOrdersByCondition(Integer soid,String sname, String sidCard,HttpSession session) throws OrderException{
			System.out.println("oid = " + soid + "sname = " + sname + " idCard = " + sidCard);
			List<Order> listorderbycondition = new LinkedList<>();
			listorderbycondition.addAll(orderSvc.queryOrdersByCondition(soid,sname,sidCard));
			for(int i = 0;i < listorderbycondition.size();i++) {
				System.out.println(listorderbycondition.get(i));
			}
			System.out.println("��ִ��sql");
			session.setAttribute("listallorders",listorderbycondition);
			System.out.println("�ѽ��鵽�Ľ��ע��session������");
			return "admin/ShowAllOrder";
		}
		
		//���ݶ�������ʱ���ѯ����
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
			System.out.println("��ִ��sql���");
			session.setAttribute("listallorders", listorderbydate);
			return "admin/ShowAllOrder";
		}
}

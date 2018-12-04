package com.oracle.ebp.controller;


import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;
import com.oracle.ebp.exception.TicketException;
import com.oracle.ebp.service.ImagesService;

@Controller
@RequestMapping(value = "/images")
public class ImagesController {
	@Resource
	private ImagesService imagesSvc;
	
	//查所有票详情
	@RequestMapping(value = "/queryAllImages")
	public String queryAllImages(HttpSession session) throws TicketException {
		List<TicketDetail> getTicketDetailList =  new LinkedList<>();
		getTicketDetailList.addAll(imagesSvc.getAllTicketDetail());
		List<Ticket> getTicketList =  new LinkedList<>();
		getTicketList.addAll(imagesSvc.getTicketList());
		System.out.println("已执行数据库语言");
		List<TicketDetail> addList  =  new LinkedList<>();
		for(int i = 0; i < 5; i++) {
			addList.add(getTicketDetailList.get(i));
			System.out.println("list1 = "+addList.get(i));
		}
		session.setAttribute("getTicketDetailList", addList);
		session.setAttribute("buytickesurface", getTicketList);
		return "ShowTicket";
	}
	
	//根据描述查询票详情
	@RequestMapping(value = "queryAllImagesByCondition")
	public String queryAllImagesByCondition(HttpServletRequest request,HttpSession session) throws TicketException{
		List<TicketDetail> getTicketDetailListByContion =  new LinkedList<>();
		String descs = request.getParameter("search");
		System.out.println(descs);
		getTicketDetailListByContion.addAll(imagesSvc.getTicketDetailListByContion(descs));
		session.setAttribute("getTicketDetailList", getTicketDetailListByContion);
		return "/Search";
	}
	
}

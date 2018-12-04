package com.oracle.ebp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.ebp.domain.AddTicketBean;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.UpdateTicketBean;
import com.oracle.ebp.exception.TicketException;
import com.oracle.ebp.service.TicketService;

@Controller
@RequestMapping(value = "/ticket")
public class TicketController {
	@Resource
	private TicketService ticketSvc;

	/***************** �û����� *******************/
	// ��ѯ����Ʊ��
	@RequestMapping(value = "/user_queryTickets")
	public ModelAndView UserlistAllTickets(Integer currentPage, Integer pageSize, Integer recordCount) {
		if (currentPage == null || currentPage <= 0)
			currentPage = 1;
		if (pageSize == null)
			pageSize = 7;
		if (recordCount == null)
			recordCount = 0;
		ModelAndView mv = new ModelAndView();
		mv.addObject("userlistalltickets", ticketSvc.getTicketPaging(currentPage, pageSize, recordCount));
		mv.setViewName("user/ShowTickets");
		return mv;
	}

	// �������ڲ�ѯƱ��
	@RequestMapping(value = "/queryTicketsByDate")
	public ModelAndView queryTicketsByDate(String date) {
		int currentPage = 1;
		int pageSize = 7;
		int recordCount = 0;
		System.out.println(date);
		Date startTime = new Date(0);
		startTime = Date.valueOf(date);
		ModelAndView mv = new ModelAndView();
		mv.addObject("userlistalltickets",
				ticketSvc.getTicketPagingByDate(currentPage, pageSize, recordCount, startTime));
		mv.setViewName("user/ShowTickets");
		return mv;
	}

	/***************** ����Ա���� *******************/

	// ����Ա��ѯ����Ʊ��
	@RequestMapping(value = "/queryTickets")
	public ModelAndView AdminlistAllTickets(Integer currentPage, Integer pageSize, Integer recordCount) {
		if (currentPage == null || currentPage <= 0)
			currentPage = 1;
		if (pageSize == null)
			pageSize = 10;
		if (recordCount == null)
			recordCount = 0;
		ModelAndView mv = new ModelAndView();
		mv.addObject("listalltickets", ticketSvc.getTicketPaging(currentPage, pageSize, recordCount));
		mv.setViewName("admin/ShowAllTicket");
		return mv;
	}

	// �������ڲ�ѯƱ��
	@RequestMapping(value = "/GetTicketBySday_Eday")
	public ModelAndView AdminqueryTicketsByDate(String date) {
		int currentPage = 1;
		int pageSize = 7;
		int recordCount = 0;
		System.out.println(date);
		Date startTime = new Date(0);
		startTime = Date.valueOf(date);
		ModelAndView mv = new ModelAndView();
		mv.addObject("listtickets", ticketSvc.getTicketPagingByDate(currentPage, pageSize, recordCount, startTime));
		mv.setViewName("admin/ShowTicketByDate");
		return mv;
	}

	// ����Ա����tid��ѯƱ��
	@RequestMapping(value = "/AdminGetTicketById")
	public String AdminGetTicketById(Integer tid, HttpSession session) throws TicketException {
		List<Ticket> adminGetTicketById = new LinkedList<>();
		adminGetTicketById.addAll(ticketSvc.AdminGetTicketById(tid));
		session.setAttribute("listalltickets", adminGetTicketById);
		return "admin/UpdateTicket";
	}

	// ����Ա�޸�Ʊ����Ϣ
	@RequestMapping(value = "/UpdateTicketAction")
	public String UpdateTicketAction(@Valid @ModelAttribute("updateTicketBean") UpdateTicketBean utb, Errors errors,
			HttpSession session) throws TicketException {
		System.out.println("utb=" + utb);
		ticketSvc.UpdateTicketAction(utb);
		System.out.println(utb.toString());
		return "admin/UpdateTicketSucc";
		// ��֤����Ϣ
	}

	// ����Ա������Ʊ״̬
	@RequestMapping(value = "/updateTicketById")
	public void UpdateTicketById(Integer statu, Integer tid, HttpServletResponse response) throws TicketException {
		PrintWriter out;
		ticketSvc.updateUserStatusById(statu, tid);
		System.out.println("statu=" + statu + ",tid=" + tid);
		System.out.println("��ִ�����ݿ�������");
		try {
			out = response.getWriter();
			out.write(statu.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// ����Ա���Ʊ��
	@RequestMapping(value = "/AddTicket")
	public String AddTicket(@Valid @ModelAttribute("addTicketBean") AddTicketBean atb, Errors errors,
			HttpSession session) throws TicketException {
		if (errors.hasFieldErrors())
			return "admin/AddTicket";
		try {
			ticketSvc.AddTicket(atb);
			return "admin/UpdateTicketSucc";
		} catch (Exception e) {
			// TODO: handle exception
			return "admin/AddTicket";
		}
	}
}

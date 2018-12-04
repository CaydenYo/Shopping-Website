package com.oracle.ebp.service;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.TicketMapper;
import com.oracle.ebp.domain.AddTicketBean;
import com.oracle.ebp.domain.PageBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.UpdateTicketBean;
import com.oracle.ebp.exception.TicketException;
import com.oracle.ebp.util.tools.WebTool;


@Service
@Scope("singleton")
public class TicketService {
	@Resource
	private TicketMapper ticketMapper;
	Date date = new Date(System.currentTimeMillis());
	
	//查询所有票项
	public PageBean<Ticket> getTicketPaging(int currentPage,int pageSize,int recordCount){
		try {
			int start=currentPage==1?0:(currentPage-1)*pageSize;
			if(recordCount==0){
				recordCount=ticketMapper.getCount();
			}
			List<Ticket> list=ticketMapper.listAllTickets(start, pageSize);
			PageBean<Ticket> pageBean=new PageBean<Ticket>(currentPage, pageSize, list, recordCount);
			return pageBean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	//根据日期查询票项
	public PageBean<Ticket> getTicketPagingByDate(int currentPage, int pageSize, int recordCount,Date startTime) {
		try {
			int start=currentPage==1?0:(currentPage-1)*pageSize;
			if(recordCount==0){
				recordCount=ticketMapper.getCount();
			}
			Date beforeTime = WebTool.getBeforeDate(startTime);
			List<Ticket> list=ticketMapper.getTicketPagingByDate(start, pageSize,startTime,beforeTime);
			PageBean<Ticket> pageBean=new PageBean<Ticket>(currentPage, pageSize, list, recordCount);
			return pageBean;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//根据tid查询票项
	public List<Ticket> AdminGetTicketById(Integer tid) throws TicketException{
		return ticketMapper.AdminGetTicketById(tid);
	}
	
	//更改票项信息
	public void UpdateTicketAction(UpdateTicketBean utb) throws TicketException{
		try {
			int tid = utb.getTid();
			String descs = utb.getDescs();
			int amount = utb.getAmount();
			int balance = utb.getBalance();
			double price = utb.getPrice();
			ticketMapper.UpdateTicketAction(tid,descs,amount,balance,price);
		} catch (Exception e) {
			// TODO: handle exception
			throw new TicketException("数据库异常：" + e.getMessage(),e);
		}
	}
	//更改票项状态
	public void updateUserStatusById(Integer statu,Integer uid) throws TicketException{
		ticketMapper.updateTicketById(statu, uid);
	}
	
	//添加票项
	public void AddTicket(AddTicketBean atb) throws TicketException{
		try {
			String descs = atb.getDescs();
			int amount = atb.getAmount();
			int balance = atb.getBalance();
			double price = atb.getPrice();
			int statu = atb.getStatus();
			ticketMapper.AddTicket(descs, date, amount, balance, price, statu);
			System.out.println(descs);
		} catch (Exception e) {
			// TODO: handle exception
			throw new TicketException("数据库异常：" + e.getMessage(),e);
		}
	}

	//结算购物车后减少对应票的票数
	public void reduceCount(QueryShoppingCartBean qscb) {
		// TODO Auto-generated method stub
		int tid = qscb.getTid();
		int quantity = qscb.getQuantity();
		ticketMapper.reduceCount(tid,quantity);
	}



}

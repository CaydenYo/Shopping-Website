package com.oracle.ebp.dao;

import java.sql.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.oracle.ebp.domain.Ticket;

public interface TicketMapper {
	int getCount();
	public List<Ticket> listAllTickets(@Param("start")int start,@Param("length")int length);
	public List<Ticket> AdminGetTicketById(Integer tid);
	public int updateTicketById(Integer statu, Integer uid);
	public int UpdateTicketAction(int tid,String descs,int amount,int balance,double price);
	public int AddTicket(String descs,Date startTime,int amount,int balance,double price,int statu);
	public void reduceCount(int tid, int quantity);
	public List<Ticket> getTicketPagingByDate(@Param("start")int start,@Param("length")int length, @Param("startTime")Date startTime,Date beforeTime);
}

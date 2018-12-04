package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;

public interface ImagesMapper {
	//获得所有票项详情
	public List<TicketDetail> getAllTicketDetail();

	//获取所有票项
	public List<Ticket> getTicketList();

	//根据描述获取票项详情
	public List<TicketDetail> getTicketDetailListByContion(String descs);
}

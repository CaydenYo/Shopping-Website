package com.oracle.ebp.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.ImagesMapper;
import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;
import com.oracle.ebp.exception.TicketException;

@Service
@Scope("singleton")
public class ImagesService {
	
	@Resource
	private ImagesMapper imagesMapper;
	//查询所有票项信息
	public List<Ticket> getTicketList() throws TicketException{
		return imagesMapper.getTicketList();
	};
	
	//获取票项的图片及描述
	public List<TicketDetail> getAllTicketDetail() throws TicketException{
		return imagesMapper.getAllTicketDetail();
	}

	//根据描述获取票项详情
	public List<TicketDetail> getTicketDetailListByContion(String descs) {
		// TODO Auto-generated method stub
		return imagesMapper.getTicketDetailListByContion(descs);
	}
}

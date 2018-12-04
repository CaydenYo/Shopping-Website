package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.Ticket;
import com.oracle.ebp.domain.TicketDetail;

public interface ImagesMapper {
	//�������Ʊ������
	public List<TicketDetail> getAllTicketDetail();

	//��ȡ����Ʊ��
	public List<Ticket> getTicketList();

	//����������ȡƱ������
	public List<TicketDetail> getTicketDetailListByContion(String descs);
}

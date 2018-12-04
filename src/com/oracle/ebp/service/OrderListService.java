package com.oracle.ebp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.OrderListMapper;
import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.OrderList;
import com.oracle.ebp.exception.OrderListException;

@Service
@Scope("singleton")
public class OrderListService {

	@Resource
	OrderListMapper orderlistMapper;
	//���ݶ��������ʾ��������
	public List<OrderList> showUserOrderList(int oid) throws OrderListException{
		return orderlistMapper.showUserOrderList(oid);
	}
	
	//�û����㹺�ﳵ��Ӷ�������
	public void addOrderList(AddOrderBean addOrderBean) {
		// TODO Auto-generated method stub
		orderlistMapper.addOrderList(addOrderBean);
	}
}

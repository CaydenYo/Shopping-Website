package com.oracle.ebp.service;


import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.OrderMapper;
import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderListBean;
import com.oracle.ebp.exception.OrderException;

@Service
@Scope("singleton")
public class OrderService {
	@Resource
	private OrderMapper orderMapper;
    
	//��ѯ���˶���
	public List<Order> listUserOrders(int uid) throws OrderException{
		return orderMapper.listUserOrders(uid);
	}
	
	//��ѯ�����û�����
	public List<Order> queryAllOrders() throws OrderException{
		return orderMapper.queryAllOrders();
	}
	
	//��ѯָ���û�����
	public List<Order> listAllOrders(int uid) throws OrderException{
		return orderMapper.queryOrdersByUid(uid);
	}

	//���������ѯ�û�����
	public List<Order> queryOrdersByCondition(Integer oid,String name,String idCard){
		int Oid = oid;
		return orderMapper.queryOrdersByCondition(Oid, name, idCard);
	}
	
	//���㹺�ﳵ����Ӷ���
	public void addOrder(AddOrderBean addOrderBean) throws OrderException{
		orderMapper.addOrder(addOrderBean);
	}

	public List<Order> queryOrdersByDate(Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return orderMapper.queryOrdersByDate(startTime,endTime);
	}
	
}

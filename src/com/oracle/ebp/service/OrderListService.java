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
	//根据订单编号显示订单详情
	public List<OrderList> showUserOrderList(int oid) throws OrderListException{
		return orderlistMapper.showUserOrderList(oid);
	}
	
	//用户结算购物车添加订单详情
	public void addOrderList(AddOrderBean addOrderBean) {
		// TODO Auto-generated method stub
		orderlistMapper.addOrderList(addOrderBean);
	}
}

package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.OrderList;


public interface OrderListMapper {
	public List<OrderList> showUserOrderList(int oid);

	public void addOrderList(AddOrderBean addOrderBean);
}

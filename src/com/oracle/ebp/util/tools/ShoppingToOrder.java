package com.oracle.ebp.util.tools;

import java.util.LinkedList;
import java.util.List;

import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.User;

public class ShoppingToOrder {
	public static List<AddOrderBean> convert(List<QueryShoppingCartBean> queryShoppingCartBean,User user){
		List<AddOrderBean> list = new LinkedList<AddOrderBean>();
		QueryShoppingCartBean bean = new QueryShoppingCartBean();
		for(int i = 0; i < queryShoppingCartBean.size(); i++){
			bean = queryShoppingCartBean.get(i);
			list.add(new AddOrderBean(-1,bean.getQuantity()*bean.getPrice(),user.getUid(),bean.getDescs(),bean.getPrice(),bean.getQuantity()));
		}
		return list;		
	}
	public ShoppingToOrder() {
		// TODO Auto-generated constructor stub
	}

}

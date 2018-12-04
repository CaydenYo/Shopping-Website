package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.AddShoppingCartBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.User;

public interface ShoppingCartMapper {
	//加入购物车
	public void addShoppingCart(AddShoppingCartBean addShoppingCartBean);
	
	//加入购物车详情
	public void addShoppingCartDetail(AddShoppingCartBean addShoppingCartBean);
	
	//列出购物车详情
	public List<QueryShoppingCartBean> showShoppingCart(User user);
	
	//根据购物车号删除购物车详情
	public void deleteShoppingCartDetail(int scid);
	
	//根据购物车号删除购物车
	public void deleteShoppingCart(int scid);
}

package com.oracle.ebp.service;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.ShoppingCartMapper;
import com.oracle.ebp.domain.AddShoppingCartBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.ShoppingCartException;

@Service
@Scope("singleton")
public class ShoppingCartService {
	
	@Resource
	private ShoppingCartMapper shoppingCartMapper;
	
	//添加至购物车及购物车详情
	public void addShoppingCart(AddShoppingCartBean addShoppingCartBean) throws ShoppingCartException{
		shoppingCartMapper.addShoppingCart(addShoppingCartBean);
		shoppingCartMapper.addShoppingCartDetail(addShoppingCartBean);
	}

	//列出购物车清单
	public List<QueryShoppingCartBean> showShoppingCart(User user) throws ShoppingCartException{
		return shoppingCartMapper.showShoppingCart(user);
	}
	
	//根据购物车编号删除购物车
	public void deleteShoppingCartAndDetail(Integer scid) throws ShoppingCartException{
		int sc_id = scid;
		shoppingCartMapper.deleteShoppingCartDetail(sc_id);
		shoppingCartMapper.deleteShoppingCart(sc_id);
	}

	
}

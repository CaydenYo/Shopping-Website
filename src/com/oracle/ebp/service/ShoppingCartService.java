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
	
	//��������ﳵ�����ﳵ����
	public void addShoppingCart(AddShoppingCartBean addShoppingCartBean) throws ShoppingCartException{
		shoppingCartMapper.addShoppingCart(addShoppingCartBean);
		shoppingCartMapper.addShoppingCartDetail(addShoppingCartBean);
	}

	//�г����ﳵ�嵥
	public List<QueryShoppingCartBean> showShoppingCart(User user) throws ShoppingCartException{
		return shoppingCartMapper.showShoppingCart(user);
	}
	
	//���ݹ��ﳵ���ɾ�����ﳵ
	public void deleteShoppingCartAndDetail(Integer scid) throws ShoppingCartException{
		int sc_id = scid;
		shoppingCartMapper.deleteShoppingCartDetail(sc_id);
		shoppingCartMapper.deleteShoppingCart(sc_id);
	}

	
}

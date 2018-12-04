package com.oracle.ebp.dao;

import java.util.List;

import com.oracle.ebp.domain.AddShoppingCartBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.User;

public interface ShoppingCartMapper {
	//���빺�ﳵ
	public void addShoppingCart(AddShoppingCartBean addShoppingCartBean);
	
	//���빺�ﳵ����
	public void addShoppingCartDetail(AddShoppingCartBean addShoppingCartBean);
	
	//�г����ﳵ����
	public List<QueryShoppingCartBean> showShoppingCart(User user);
	
	//���ݹ��ﳵ��ɾ�����ﳵ����
	public void deleteShoppingCartDetail(int scid);
	
	//���ݹ��ﳵ��ɾ�����ﳵ
	public void deleteShoppingCart(int scid);
}

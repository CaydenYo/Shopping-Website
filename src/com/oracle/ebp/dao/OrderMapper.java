package com.oracle.ebp.dao;

import java.sql.Date;
import java.util.List;

import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderListBean;

public interface OrderMapper {

	/**
	 * ��Ӷ���
	 * @param order
	 */
	public void addOrders(Order order);

	public List<Order> listUserOrders(int uid);
	
	/**
	 * ��ѯָ���û������ж���
	 * @return
	 */
	public List<Order> queryOrdersByUid(int uid);
	
	//�û����㹺�ﳵ��Ӷ���
	public void addOrder(AddOrderBean addOrderBean);
	
	
//	================================================����Ա����
	
	/**
	 * ���ݶ���ʱ���ҳ��ѯ����
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<Order> queryOrdersByDatePage(Date begin,Date end,int index,int pageSize);
	
	/**
	 * ��ѯ���ж���
	 */
	public List<Order> queryAllOrders();
	
	
	/**
	 * ���ݶ���ʱ���ѯ��������
	 * @param begin
	 * @param end
	 * @return int
	 */
	public int queryOrderCountByDate(Date begin,Date end);
	
	/**
	 * ����������ҳ��ѯ����
	 * @param oid		�������
	 * @param name		�û���������
	 * @param idCard	���֤��
	 * @param index		��ѯ��ʼλ��
	 * @param pageSize	��ѯ����
	 * @return
	 */
	public List<Order> queryOrdersByCondition(int oid,String name,String idCard);
	
	/**
	 * ����������ѯ��������
	 * @param oid		�������
	 * @param name		�û���������
	 * @param idCard	���֤��
	 * @return
	 */
	public int queryOrdersCountByCondition(int oid,String name,String idCard);

	//���ݶ����������ڲ�ѯ����
	public List<Order> queryOrdersByDate(Date startTime, Date endTime);

	
	
}

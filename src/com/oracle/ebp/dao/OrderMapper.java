package com.oracle.ebp.dao;

import java.sql.Date;
import java.util.List;

import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.Order;
import com.oracle.ebp.domain.OrderListBean;

public interface OrderMapper {

	/**
	 * 添加订单
	 * @param order
	 */
	public void addOrders(Order order);

	public List<Order> listUserOrders(int uid);
	
	/**
	 * 查询指定用户的所有订单
	 * @return
	 */
	public List<Order> queryOrdersByUid(int uid);
	
	//用户结算购物车添加订单
	public void addOrder(AddOrderBean addOrderBean);
	
	
//	================================================管理员方法
	
	/**
	 * 根据订单时间分页查询订单
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<Order> queryOrdersByDatePage(Date begin,Date end,int index,int pageSize);
	
	/**
	 * 查询所有订单
	 */
	public List<Order> queryAllOrders();
	
	
	/**
	 * 根据订单时间查询订单数量
	 * @param begin
	 * @param end
	 * @return int
	 */
	public int queryOrderCountByDate(Date begin,Date end);
	
	/**
	 * 根据条件分页查询订单
	 * @param oid		订单编号
	 * @param name		用户名和姓名
	 * @param idCard	身份证号
	 * @param index		查询起始位置
	 * @param pageSize	查询条数
	 * @return
	 */
	public List<Order> queryOrdersByCondition(int oid,String name,String idCard);
	
	/**
	 * 根据条件查询订单数量
	 * @param oid		订单编号
	 * @param name		用户名和姓名
	 * @param idCard	身份证号
	 * @return
	 */
	public int queryOrdersCountByCondition(int oid,String name,String idCard);

	//根据订单生成日期查询订单
	public List<Order> queryOrdersByDate(Date startTime, Date endTime);

	
	
}

package com.oracle.ebp.dao;



import java.sql.Date;
import java.util.List;

import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.User;

public interface AdminMapper {
	public Admin selectBy(String username);
	public List<User> listAllUsers();
	public List<User> queryOrdersByDate(Date begin,Date end);
	public List<User> queryUsersByCondition(String name, String idCard, String telno);
	public int updateUserStatusById(Integer statu, Integer uid);
}

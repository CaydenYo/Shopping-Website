package com.oracle.ebp.service;



import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.AdminMapper;
import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.AdminException;

@Service
@Scope("singleton")
public class AdminService {
	@Resource
	private AdminMapper adminMapper;
    
	//管理员登录
	public Admin login(String username) throws AdminException{
		Admin admin = null;
		try {
			admin = adminMapper.selectBy(username);
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdminException("数据库错误:"+e.getMessage(),e);
		}
		return admin;
	}
	
	//管理员用户管理--列出所有用户
	public List<User> listAllUsers() throws AdminException{
		return adminMapper.listAllUsers();
	}

	//管理员用户管理--根据注册时间查询用户
	public List<User> queryUsersByDate(Date begin,Date end) throws AdminException{
		return adminMapper.queryOrdersByDate(begin,end);
	}
	
	//管理员用户管理--根据情况查询用户
	public List<User> queryUsersByCondition(String name, String idCard, String telno){
		return adminMapper.queryUsersByCondition(name,idCard,telno);
	}
	
	//更改用户状态
	public void updateUserStatusById(Integer statu, Integer uid) {
		// TODO Auto-generated method stub
		try {
			adminMapper.updateUserStatusById(statu, uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

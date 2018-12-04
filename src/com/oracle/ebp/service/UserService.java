package com.oracle.ebp.service;

import java.sql.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.oracle.ebp.dao.UserMapper;
import com.oracle.ebp.domain.ReChargeBean;
import com.oracle.ebp.domain.RegisterBean;
import com.oracle.ebp.domain.UpdateUserBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.UserException;

@Service
@Scope
public class UserService {
	@Resource
	UserMapper userMapper;
	
	//注册
	Date date = new Date(System.currentTimeMillis());
	public void register(RegisterBean rb) throws UserException{
		User user =new User(-1, 
							rb.getUsername(),
							rb.getPassword(),
							rb.getName(), 
							rb.getGender().equals("女")?0:1,
						    Integer.valueOf(rb.getAge()),
						    rb.getIdCard(),
						    rb.getAddress(),
						    rb.getTelno(),
						    date,0,1);
		try {
			userMapper.saveUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UserException("数据库异常:"+e.getMessage(),e);
		}
	}
	
	//登录
	public User login(String username) throws UserException{
		User user = null;
		try {
			user=userMapper.selectBy(username);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UserException("数据库异常:"+e.getMessage(),e);
		}
		return user;
	}
	
	//充值
	public void recharge(String username,ReChargeBean rcb) throws UserException{
		User user = null;
		try {
			user = userMapper.selectBy(username);
			double balance = user.getBalance();
			double total = balance + rcb.getMoney();
			user.setBalance(total);
			userMapper.updateBalance(user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new UserException("数据库异常:"+e.getMessage(),e);
		}
	}
	
	//修改个人信息
	public void updateUser(String username,UpdateUserBean uub) throws UserException{
		User user = null;
		try{
			user = userMapper.selectBy(username);
			String name = uub.getName();
		    int age = uub.getAge();
		    int gender = uub.getGender();
			String password = uub.getPassword();
		    String address = uub.getAddress();
			String telno = uub.getTelno();
			user.setName(name);
			user.setAge(age);
			user.setGender(gender);
		    user.setPassword(password);
		    user.setAddress(address);
		    user.setTelno(telno);
		    userMapper.updateUser(name,age,gender,password,address,telno,username);
		}catch (Exception e) {
			e.printStackTrace();
			throw new UserException("数据库异常:"+e.getMessage(),e);
		}
	}
	
	//结算购物车
	public void Consume(String username,Double amount) throws UserException{
		double u_amount = amount;
		userMapper.Consume(username, u_amount);
	}
}
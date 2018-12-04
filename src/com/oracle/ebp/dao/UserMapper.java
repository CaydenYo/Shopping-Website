package com.oracle.ebp.dao;



import com.oracle.ebp.domain.User;

public interface UserMapper {
	public User selectBy(String username);
	public int saveUser(User user);
	public int updateBalance(User user);
	public int updateUser(String name,int age,int gender,String password,String address,String telno,String username);
	public void Consume(String username, double amount);
}

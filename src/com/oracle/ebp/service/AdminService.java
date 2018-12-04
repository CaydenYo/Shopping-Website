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
    
	//����Ա��¼
	public Admin login(String username) throws AdminException{
		Admin admin = null;
		try {
			admin = adminMapper.selectBy(username);
		} catch (Exception e) {
			e.printStackTrace();
			throw new AdminException("���ݿ����:"+e.getMessage(),e);
		}
		return admin;
	}
	
	//����Ա�û�����--�г������û�
	public List<User> listAllUsers() throws AdminException{
		return adminMapper.listAllUsers();
	}

	//����Ա�û�����--����ע��ʱ���ѯ�û�
	public List<User> queryUsersByDate(Date begin,Date end) throws AdminException{
		return adminMapper.queryOrdersByDate(begin,end);
	}
	
	//����Ա�û�����--���������ѯ�û�
	public List<User> queryUsersByCondition(String name, String idCard, String telno){
		return adminMapper.queryUsersByCondition(name,idCard,telno);
	}
	
	//�����û�״̬
	public void updateUserStatusById(Integer statu, Integer uid) {
		// TODO Auto-generated method stub
		try {
			adminMapper.updateUserStatusById(statu, uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

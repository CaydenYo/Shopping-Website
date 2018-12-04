package com.oracle.ebp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.domain.LoginBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.AdminException;
import com.oracle.ebp.service.AdminService;
import com.oracle.ebp.util.constant.Constant;
import com.oracle.ebp.util.tools.WebTool;


@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Resource
	private AdminService adminSvc;
	
	//登录
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid @ModelAttribute("loginBean") LoginBean lb, Errors errors, HttpSession session) {
		if(errors.hasFieldErrors())return "admin/login";
		Admin admin=null;
		try {
			admin = adminSvc.login(lb.getUsername());
			if(admin==null || !admin.getPassword().equals(lb.getPassword())){
				errors.reject("","用户名或密码错误");
				return "admin/login";
			}
			session.setAttribute(Constant.SESSION_ADMIN, admin);
			System.out.println(admin.toString());
			String forwardUrl = (String)session.getAttribute(Constant.ADMIN_ATTR_NEXTURL);
			System.out.println(forwardUrl);
	        if (forwardUrl == null) forwardUrl = "/admin/index.jsp";     //when session timeout
	        return "redirect:" + forwardUrl;
		} catch (AdminException e) {
			errors.reject("", "登录出现异常，请稍后再试");
			return "admin/login";
		}
	}
	
	//管理员登出
	@RequestMapping(value = "/logout",method = {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession session) {
			session.removeAttribute(Constant.SESSION_ADMIN);
			return "redirect:/index.jsp";
	}
	
	//更改状态
	@RequestMapping(value = "/updateUserStatusById", method = RequestMethod.POST)
	public void updateUserStatusById(Integer statu,Integer uid,HttpServletResponse response){
		PrintWriter out;
		adminSvc.updateUserStatusById(statu,uid);
		System.out.println("statu="+statu+",uid="+uid);
		System.out.println("已执行数据库更新语句");
		try {
			out = response.getWriter();
			out.write(statu.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	//列出所有用户
	@RequestMapping(value = "/queryUsers", method = RequestMethod.GET)
	public String listAllUsers(HttpSession session) throws AdminException{
		List<User> listallusers = new LinkedList<>();
		listallusers.addAll(adminSvc.listAllUsers());
		session.setAttribute("listallusers",listallusers);
		return "admin/ShowAllUser";
	}
	
	//根据注册时间来查询用户
	@RequestMapping(value = "/queryUsersByDate", method = {RequestMethod.POST,RequestMethod.GET})
	public String queryUsersByDatePage(String starttime,String endtime,HttpSession session) throws AdminException, ParseException{
		System.out.println("beginTime = " + starttime + " endTime = " + endtime + " CurrentTime = " + WebTool.getCurrentDate());
		Date startTime = new Date(0);
		Date endTime = new Date(0);
		if(starttime == null || starttime.trim().equals("")) {
			startTime = WebTool.getBeforeDate(WebTool.getCurrentDate());
		}
		if(endtime == null || endtime.trim().equals("")) {
			endTime = WebTool.getCurrentDate();
		}
		else {
			startTime = Date.valueOf(starttime);
			endTime= Date.valueOf(endtime);
		}
		System.out.println("beginTime = " + startTime + " endTime = " + endTime);
		List<User> listuserbydate = new LinkedList<>();
		listuserbydate.addAll(adminSvc.queryUsersByDate(startTime,endTime));
		System.out.println("已执行sql语句");
		session.setAttribute("listallusers",listuserbydate);
		return "admin/ShowAllUser";
	}
	
	//根据姓名、身份证、年龄来查询用户
	@RequestMapping(value = "/queryUsersByCondition", method = {RequestMethod.POST,RequestMethod.GET})
	public String queryUsersByCondition(String name, String idCard, String telno,HttpSession session) throws AdminException{
		session.setAttribute("listallusers",null);
		System.out.println("sname = " + name + " sidCard = " + idCard + "stelno = "+ telno);
		List<User> listuserbycondition = new LinkedList<>();
		listuserbycondition.addAll(adminSvc.queryUsersByCondition(name,idCard,telno));
		System.out.println("已执行sql");
		session.setAttribute("listallusers",listuserbycondition);
		System.out.println("已将查到的结果注入session作用域");
		return "admin/ShowAllUser";
	}
	
}
	

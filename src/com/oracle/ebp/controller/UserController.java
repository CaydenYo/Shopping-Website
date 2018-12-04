package com.oracle.ebp.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.ebp.domain.AddOrderBean;
import com.oracle.ebp.domain.LoginBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.ReChargeBean;
import com.oracle.ebp.domain.RegisterBean;
import com.oracle.ebp.domain.UpdateUserBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.UserException;
import com.oracle.ebp.service.OrderListService;
import com.oracle.ebp.service.OrderService;
import com.oracle.ebp.service.ShoppingCartService;
import com.oracle.ebp.service.TicketService;
import com.oracle.ebp.service.UserService;
import com.oracle.ebp.util.constant.Constant;
import com.oracle.ebp.util.tools.ShoppingToOrder;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Resource
	private UserService userSvc;
	// 注册
	@RequestMapping(value = "/register", method = {RequestMethod.GET,RequestMethod.POST})
	public String register(@Valid @ModelAttribute("registerBean") RegisterBean rb, Errors errors) {
		// 验证表单错误信息
		if (errors.hasFieldErrors())
			return "user/register";
		// 将User对象添加到数据库中
		if (!rb.getPassword().equals(rb.getConPassword())) {
			errors.rejectValue("conPassword", "empty.registerBean.conPassword", "两次输入的密码不一致");
			return "user/register";
		}
		try {
			if (userSvc.login(rb.getUsername())!=null) {
				errors.rejectValue("username", "empty.registerBean.username", "用户名已被占用，请修改");
				return "user/register";
			}
		} catch (UserException e1) {
			errors.reject("", "注册出现异常，请稍后再试");
			return "user/register";
		}
		// 返回User的主页
		try {
			userSvc.register(rb);
		} catch (UserException e) {
			errors.reject("", "注册出现异常，请稍后再试");
			return "user/register";
		}
		return "redirect:/index.jsp";
}
	
	//登录
	@RequestMapping(value = "/login", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(@Valid @ModelAttribute("loginBean") LoginBean lb, Errors errors, HttpSession session) {
		if(errors.hasFieldErrors())return "user/login";
		User user=null;
		try {
			
			user=userSvc.login(lb.getUsername());
			if(user==null || !user.getPassword().equals(lb.getPassword())){
				errors.reject("","用户名或密码错误");
				return "user/login";
			}
			if(user.getStatus() == 0) {
				errors.reject("","当前用户已被禁用，请联系管理员");
				return "user/login";
			}
			session.setAttribute(Constant.SESSION_USER, user);
			String forwardUrl = (String)session.getAttribute(Constant.ATTR_NEXTURL);
	        if (forwardUrl == null) forwardUrl = "/index.jsp";     //when session timeout
	        return "redirect:" + forwardUrl;
		} catch (UserException e) {
			errors.reject("", "登录出现异常，请稍后再试");
			return "user/login";
		}
	}
	
	//用户登出
		@RequestMapping(value = "/logout",method = {RequestMethod.POST,RequestMethod.GET})
		public String logout(HttpSession session) {
				//session.setAttribute(Constant.ATTR_NEXTURL, "/user/index.jsp");
				session.removeAttribute(Constant.SESSION_USER);
				return "redirect:/index.jsp";
		}
	
	//充值
	@RequestMapping(value = "/TopUpAccount",method = RequestMethod.POST)
	public String recharge(@Valid @ModelAttribute("reChargeBean") ReChargeBean rcb, Errors errors,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException{
		if(errors.hasFieldErrors())return "user/TopUpAccount";
		//从session作用域中拿到已经登录的用户
		User user = (User)session.getAttribute(Constant.SESSION_USER);
		System.out.println(rcb.getWay());
		System.out.println(rcb.getMoney());
		double balance = user.getBalance();
		double finalMoney = balance + rcb.getMoney();
		try{
			request.setAttribute("way",rcb.getWay());
			request.setAttribute("money",rcb.getMoney());
			userSvc.recharge(user.getUsername(),rcb);
			user.setBalance(finalMoney);
			session.setAttribute(Constant.SESSION_USER, user);
//			RequestDispatcher view = request.getRequestDispatcher("/EBP_19/user/TopUpSucc.jsp");
//	        view.forward(request, response);
			return "user/TopUpSucc";
		}catch(UserException e){
			errors.reject("", "充值出现异常，请稍后再试");
			return "user/TopUpAccount";
		}
	}
	
	//修改个人信息
	@RequestMapping(value = "/updateUser",method = RequestMethod.POST)
	public String updateUser(@Valid @ModelAttribute("updateUserBean") UpdateUserBean uub, Errors errors, HttpSession session){
		if(errors.hasFieldErrors())return "user/updateUser";
		User user = null;
		//从session作用域中拿到已经登录的用户
		user = (User)session.getAttribute(Constant.SESSION_USER);
		if (uub.getPassword() != null && !uub.getPassword().equals(uub.getConPassword())) {
			errors.rejectValue("conPassword", "empty.registerBean.conPassword", "两次输入的密码不一致");
			return "user/updateUser";
		}
		try{
			userSvc.updateUser(user.getUsername(),uub);
			session.setAttribute(Constant.SESSION_USER, user);
			return "redirect:/user/login";
		}catch(UserException e){
			errors.reject("", "修改个人信息出现异常，请稍后再试");
			return "user/updateUser";
		}
	}
	
	@Resource
	OrderService orderSvc;
	
	@Resource
	OrderListService orderListSvc;
	
	@Resource
	TicketService ticketSvc;
	
	@Resource
	ShoppingCartService shoppingCartSvc;
	
	//在线购买
	@RequestMapping(value = "/summaryMoney",method = {RequestMethod.POST,RequestMethod.GET})
	public String BuyOnline(Double sumMoney,HttpSession session,HttpServletRequest request) {
		System.out.println(sumMoney);
		User user = (User)session.getAttribute(Constant.SESSION_USER);
		if(sumMoney > user.getBalance()) {
			request.setAttribute("errop", "余额不足！请充值");
			return "user/ShoppingCart";
		}
		request.setAttribute("errop", "");
		double balance = user.getBalance();
		balance -= sumMoney;
		user.setBalance(balance);
		session.setAttribute(Constant.SESSION_USER, user);
		List<QueryShoppingCartBean> userShoppingCartList = new LinkedList<>();
		List<AddOrderBean> addList = ShoppingToOrder.convert((List<QueryShoppingCartBean>) session.getAttribute("shoppingcartlist"), user);
		for(int k = 0; k < addList.size(); k++){
			System.out.println(addList.get(k).toString());
		}
		try {
			userSvc.Consume(user.getUsername(),sumMoney);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			for(int i = 0;i < addList.size();i++) {
				orderSvc.addOrder(addList.get(i));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			for(int j = 0;j < addList.size();j++) {
				orderListSvc.addOrderList(addList.get(j));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			for(int b = 0;b < addList.size();b++) {
				ticketSvc.reduceCount(userShoppingCartList.get(b));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			for(int a = 0;a < addList.size();a++) {
				shoppingCartSvc.deleteShoppingCartAndDetail(userShoppingCartList.get(a).getScid());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return "redirect:/order/getLatestOrder";
	}
}

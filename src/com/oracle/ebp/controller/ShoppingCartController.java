package com.oracle.ebp.controller;

import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.ebp.domain.AddShoppingCartBean;
import com.oracle.ebp.domain.QueryShoppingCartBean;
import com.oracle.ebp.domain.User;
import com.oracle.ebp.exception.ShoppingCartException;
import com.oracle.ebp.service.ShoppingCartService;
import com.oracle.ebp.util.constant.Constant;

@Controller
@RequestMapping(value = "/shoppingcart")
public class ShoppingCartController {
	@Resource
	ShoppingCartService shoppingCartSvc;
	
	//��ӹ��ﳵ
	@RequestMapping(value = "/addShoppingCart",method = RequestMethod.POST)
	public String AddShoppingCart(Integer quantity,Integer tid,HttpSession session,HttpServletResponse response) {
		System.out.println(quantity +" " + tid + "");
		PrintWriter out;
		User user = (User)session.getAttribute(Constant.SESSION_USER);
		Integer uid = user.getUid();
		try {
			shoppingCartSvc.addShoppingCart(new AddShoppingCartBean(-1,tid,quantity,uid));
			out = response.getWriter();
			out.write("ok");
			out.flush();
			out.close();
			return "user/ShowTickets";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "user/ShowTickets";
		}
		
	}
	
	//չʾ���ﳵ
	@RequestMapping(value = "/showCart",method = {RequestMethod.POST,RequestMethod.GET})
	public String ShowCart(HttpSession session) {
		User user = (User)session.getAttribute(Constant.SESSION_USER);
		List<QueryShoppingCartBean> showShoppingCartList = new LinkedList<>();
		try {
			System.out.println("׼��չʾ���ﳵ");
			showShoppingCartList.addAll(shoppingCartSvc.showShoppingCart(user));
			System.out.println("��ִ��չʾ���ﳵ���ݿ�����");
			session.setAttribute("shoppingcartlist", showShoppingCartList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "user/ShoppingCart";
	}
	
	//ɾ�����ﳵ
	@RequestMapping(value = "/deleteCart",method = {RequestMethod.POST,RequestMethod.GET})
	public String DeleteCart(Integer scid,HttpSession session) throws ShoppingCartException {
		System.out.println("scid = " + scid);
		shoppingCartSvc.deleteShoppingCartAndDetail(scid);
		User user = (User)session.getAttribute(Constant.SESSION_USER);
		List<QueryShoppingCartBean> showShoppingCartList = new LinkedList<>();
		try {
			System.out.println("׼��ִ��ɾ�����ﳵ");
			showShoppingCartList.addAll(shoppingCartSvc.showShoppingCart(user));
			System.out.println("��ִ��ɾ�����ﳵ���ݿ�����");
			session.setAttribute("shoppingcartlist", showShoppingCartList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "user/ShoppingCart";
	}
}

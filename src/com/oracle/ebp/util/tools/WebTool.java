package com.oracle.ebp.util.tools;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.ui.Model;

public class WebTool {
	
	public static void main(String[] args) {
		double dou=Math.random()*1000;
		System.out.println(dou);
	}
	
	/**
	 * 根据总数量和页面大小，获取总页数
	 * @param allCount 总页数
	 * @param pageSize 页面长度
	 * @return
	 */
	public static int getPageCount(int allCount,int pageSize){
		if(allCount==0){
			return 1;
		}
		return allCount%pageSize==0?allCount/pageSize:allCount/pageSize+1;
	}
	
	/**
	 * 向Model中添加当前页，和页面总数
	 * @param model
	 * @param pageCount	页面总数
	 * @param currentPage 当前页
	 */
	public static void addPageAttribute(Model model,int pageCount,int currentPage
			,Date begin,Date end){
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
	}
	
	/**
	 * 获取当前时间前七天时间。
	 * @param date
	 * @return
	 */
	public static Date getBeforeDate(Date date){
		Calendar cal=Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, -7);
		Date beforeDate=new Date(cal.getTime().getTime());
		return beforeDate;
	}
	
	/**
	 * 获取当前时间
	 * @return sql.Date
	 */
	public static Date getCurrentDate() {
		return new Date(new java.util.Date().getTime());
	}
}

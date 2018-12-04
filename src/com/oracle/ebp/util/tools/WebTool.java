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
	 * ������������ҳ���С����ȡ��ҳ��
	 * @param allCount ��ҳ��
	 * @param pageSize ҳ�泤��
	 * @return
	 */
	public static int getPageCount(int allCount,int pageSize){
		if(allCount==0){
			return 1;
		}
		return allCount%pageSize==0?allCount/pageSize:allCount/pageSize+1;
	}
	
	/**
	 * ��Model����ӵ�ǰҳ����ҳ������
	 * @param model
	 * @param pageCount	ҳ������
	 * @param currentPage ��ǰҳ
	 */
	public static void addPageAttribute(Model model,int pageCount,int currentPage
			,Date begin,Date end){
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
	}
	
	/**
	 * ��ȡ��ǰʱ��ǰ����ʱ�䡣
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
	 * ��ȡ��ǰʱ��
	 * @return sql.Date
	 */
	public static Date getCurrentDate() {
		return new Date(new java.util.Date().getTime());
	}
}

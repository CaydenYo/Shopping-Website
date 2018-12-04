//package com.oracle.ebp.controller;
//
//public class Test {
//	//根据注册时间查询用户信息
//		@RequestMapping(value = "/queryUsersByDatePage")
//		public String ListUserByDate(HttpServletRequest request,HttpSession session){
//			
//			List<User> ByDateList;
//			String starttime;
//			starttime = request.getParameter("begin");
//			String endtime;
//			endtime = request.getParameter("end");
//			
//			if(starttime==null){
//				starttime = "2012-01-01";
//			}
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
//														// new Date()为获取当前系统时间
//			if(endtime==null){
//				endtime = df.format(new Date());
//			}.
//			
//			ByDateList = adminSvc.getUserByDate(starttime, endtime);
//			session.setAttribute("List", ByDateList); 
//			return "admin/ShowAllUser";
//			
//		}
//
//}

//package com.oracle.ebp.controller;
//
//public class Test {
//	//����ע��ʱ���ѯ�û���Ϣ
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
//			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//�������ڸ�ʽ
//														// new Date()Ϊ��ȡ��ǰϵͳʱ��
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

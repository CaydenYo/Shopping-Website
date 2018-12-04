package com.oracle.ebp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oracle.ebp.domain.Admin;
import com.oracle.ebp.util.constant.Constant;

public class AdminLoginFilter implements Filter {

    public void init(FilterConfig filterConfig) {}
    
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();
        //获取请求页面的相对路径，为一个字符串
        String requestURI = req.getRequestURI();
        //以下尝试截取管理员拟请求的目标路径
        String uri = requestURI.substring(requestURI.indexOf(Constant.ADMIN_LOGIN_PREFIX));
        //管理员不是请求登录时，进行拦截
        if (uri.indexOf(Constant.LOGIN_KEYWORD) == -1) {
            Admin admin = (Admin)session.getAttribute(Constant.SESSION_ADMIN);
            if (admin == null) {
                session.setAttribute(Constant.ADMIN_ATTR_NEXTURL, uri);
                String loginUri = req.getContextPath() + Constant.ADMIN_LOGIN_PREFIX + Constant.LOGIN_PAGE;
                ((HttpServletResponse)response).sendRedirect(loginUri);
                return;               
            } 
        }
        chain.doFilter(request, response);
    }

    public void destroy() {}
}

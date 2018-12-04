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

import com.oracle.ebp.domain.User;
import com.oracle.ebp.util.constant.Constant;

public class UserLoginFilter implements Filter {

    
    
    public void init(FilterConfig filterConfig) {}
    
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();
        
        String requestURI = req.getRequestURI();
        //以下尝试截取用户拟请求的目标路径
        String uri = requestURI.substring(requestURI.indexOf(Constant.LOGIN_PREFIX));
        //用户既不是请求登录，也不是请求注册时，进行拦截
        if (uri.indexOf(Constant.LOGIN_KEYWORD) == -1 && uri.indexOf(Constant.REGISTER_KEYWORD)==-1) {
            User user = (User)session.getAttribute(Constant.SESSION_USER);
            if (user == null) {
                session.setAttribute(Constant.ATTR_NEXTURL, uri);
                String loginUri = req.getContextPath() + Constant.LOGIN_PREFIX + Constant.LOGIN_PAGE;
                ((HttpServletResponse)response).sendRedirect(loginUri);
                return;               
            } 
        }
        chain.doFilter(request, response);
    }

    public void destroy() {}
}
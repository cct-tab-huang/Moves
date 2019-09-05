package com.houpu.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class loginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("我是拦截器，来盘我啊");
		HttpSession session=request.getSession();
		Integer getabc=(Integer) session.getAttribute("abc");
		if (getabc==1) {
			if (session.getAttribute("clients")==null) {
				response.sendRedirect(request.getContextPath()+"/cliLogin");
				return false;
			}else{
				return true;
			}
		}else{
			if (session.getAttribute("user")==null) {
				response.sendRedirect(request.getContextPath()+"/Userlogins");
				return false;
			}else{
				return true;
			}	
		}
	}
}

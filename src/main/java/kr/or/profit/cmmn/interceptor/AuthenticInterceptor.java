package kr.or.profit.cmmn.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String id = (String) request.getSession().getAttribute("memberId");
		String requestUrl = request.getRequestURL().toString();
		String contextPath = request.getContextPath();
		StringBuilder url = new StringBuilder();
		url.append(request.getContextPath());
		
		if(request.getServletPath() == null) {
			request.getSession().setAttribute("returnUrl", url.toString());
		}
		
		url.append(request.getServletPath());
		url.append("?");
		url.append(request.getQueryString());
		request.getSession().setAttribute("returnUrl", url.toString());

		if (requestUrl.contains(contextPath + "/login.do")) {
			return true;
		}

		if (requestUrl.contains(contextPath + "/resources")) {
			return true;
		}

		if (id == null) {
			response.sendRedirect(contextPath + "/login.do");
			return false;
		}

		return true;
	}


}

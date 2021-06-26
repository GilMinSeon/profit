package kr.or.profit.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticInterceptor extends HandlerInterceptorAdapter {
	
	/**
	 * 세션에 계정정보(Account)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(Account)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {		

		  //로그인 세션이 없다면 login 페이지로 이동 
		  String id = (String)request.getSession().getAttribute("memberId"); 
		  String requestUrl = request.getRequestURL().toString(); 
		  String contextPath = request.getContextPath();
		  //로그인 경로 제외 
		  if(requestUrl.contains(contextPath+"/login")){ 
		      return true;
		  }

		  //리소스 경로 제외 
		  if(requestUrl.contains(contextPath+"/resources")){ 
		      return true;
		  } 
		  
		  if(requestUrl.contains(contextPath+"/")){ 
		      return true;
		  } 
		  

		  if(id==null){ 
		      response.sendRedirect(contextPath+"/login");
		      return false; 
		  } 

		  return true; 
		} 
		
		
		
		
		
		
		
		
		
		
		
		
		
//		HttpSession session=request.getSession(true);
//		if(session.getAttribute("memberId")==null){
//            response.sendRedirect("login");
//            return false;
//        }
//        
//        return true;
//    }
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws java.lang.Exception{
//        
//        super.postHandle(request, response, handler, modelAndView);
//    }
//    
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws java.lang.Exception{
//        
//        super.afterCompletion(request, response, handler, ex);
//    }
		
//		if(request.getSession().getAttribute("memberId")!=null){
//			return true;
//		}else{
//			ModelAndView modelAndView = new ModelAndView("redirect:/login");			
//			throw new ModelAndViewDefiningException(modelAndView);
//		}
	

}

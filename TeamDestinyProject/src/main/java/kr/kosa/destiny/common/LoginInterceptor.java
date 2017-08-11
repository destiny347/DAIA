package kr.kosa.destiny.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		try {
			HttpSession session = request.getSession();
			String contextName = request.getContextPath();
			String url = request.getRequestURI().replaceFirst(contextName, "");
			
			String param = request.getQueryString();
			
			if( !url.contains("/users/login") && !url.contains("/user/logout") ) {
				session.setAttribute("url", url);
				session.setAttribute("param", param);
			} else {
				//nothing
				//로그인 또는 로그아웃 uri 일 경우에는 uri 정보를 저장하지 않습니다.
			}
			
			String userEmail = (String)request.getSession().getAttribute("userEmail");
			if(userEmail == null || userEmail.equals("")) {
				/*response.sendRedirect(request.getContextPath()+"/");*/	//홈으로 redirect
				//로그인 하지 않고 기능을 사용할 경우 경고창 팝업
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 후 사용하실 수 있습니다.'); history.go(-1);</script>");
	            out.flush();
				return false;				
			}
			
			String userPw = (String)request.getSession().getAttribute("userPw");
			if(userPw != request.getSession().getAttribute("userPw")) {
				session.invalidate();
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('로그인 후 사용하실 수 있습니다.'); history.go(-1);</script>");
	            out.flush();
				return false;	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}

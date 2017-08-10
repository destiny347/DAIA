package kr.kosa.destiny.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginProcessServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		Cookie cookie = null;
		String userEmail = request.getParameter("userEmail");
		String userPw = request.getParameter("userPw");
		String userCheck = request.getParameter("userCheck");
		
		if(userCheck != null && userCheck.trim().equals("on")) {
			cookie = new Cookie("userEmail", java.net.URLEncoder.encode(userEmail));
			cookie.setMaxAge(60*60*24*365);
			response.addCookie(cookie);
		} else {
			cookie = new Cookie("userEmail", null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		response.sendRedirect(request.getContextPath()+"/welcome/welcome");
	}
}

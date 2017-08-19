package global.sesoc.meet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import global.sesoc.meet.interceptor.LoginInterceptor;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	// 콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// Code Here
		System.out.println("인터셉터진입");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		String ctx = request.getContextPath();
		if(id == null){
			System.out.println("인터셉터이프문"+ctx);
			System.out.println(ctx+"/");
			response.sendRedirect(ctx+"/");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}

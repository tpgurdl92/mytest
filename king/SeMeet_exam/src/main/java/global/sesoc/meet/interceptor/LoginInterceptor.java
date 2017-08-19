package global.sesoc.meet.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import global.sesoc.meet.interceptor.LoginInterceptor;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	// 콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		// Code Here
		
		if(request.getSession().getAttribute("loginId")==null){
			response.sendRedirect("./");
			return false;
		}	
		
		return super.preHandle(request, response, handler);
	}
}

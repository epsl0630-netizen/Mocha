package mocha.ezen.com.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import mocha.ezen.com.user.UserDTO;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 요청 url정보 → /spring/board/list/T → board/list/T
		String requestUrl = request.getRequestURI().substring(request.getContextPath().length());
		// 로그인한 사용자 정보 조회
		HttpSession session = request.getSession();
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		if(login != null) {
			return true;			
		}else {
			// 로그인하지 않은 경우
			
			// ▼ 제외할 URL을 직접 검사하는 로직 추가
		    if (requestUrl.startsWith("/home/loginOk")) {
		        return true; // 로그인 체크를 하지 않고 그냥 통과
		    }
			session.setAttribute("alertMsg", "로그인 후 이용할 수 있습니다.");
			
			// 로그인 완료후 이동할 url을 session영역안에 저장
			// requestUrl
			
			String queryString = request.getQueryString();
			String nextUrl = requestUrl + "?" + queryString;

			
			// 로그인 요청 성공 후, 세션영역안에 저장된 nextUrl값을 활용해서 페이지 이동
			session.setAttribute("nextUrl", nextUrl); 
			
			response.sendRedirect(request.getContextPath()+"/");
			
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
			
}

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
		
		// ��û url���� �� /spring/board/list/T �� board/list/T
		String requestUrl = request.getRequestURI().substring(request.getContextPath().length());
		// �α����� ����� ���� ��ȸ
		HttpSession session = request.getSession();
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		if(login != null) {
			return true;			
		}else {
			// �α������� ���� ���
			
			// �� ������ URL�� ���� �˻��ϴ� ���� �߰�
		    if (requestUrl.startsWith("/home/loginOk")) {
		        return true; // �α��� üũ�� ���� �ʰ� �׳� ���
		    }
			session.setAttribute("alertMsg", "�α��� �� �̿��� �� �ֽ��ϴ�.");
			
			// �α��� �Ϸ��� �̵��� url�� session�����ȿ� ����
			// requestUrl
			
			String queryString = request.getQueryString();
			String nextUrl = requestUrl + "?" + queryString;

			
			// �α��� ��û ���� ��, ���ǿ����ȿ� ����� nextUrl���� Ȱ���ؼ� ������ �̵�
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

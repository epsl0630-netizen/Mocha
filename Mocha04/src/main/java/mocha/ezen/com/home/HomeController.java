package mocha.ezen.com.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mocha.ezen.com.user.UserDTO;
import mocha.ezen.com.user.UserRepository;

@Controller
public class HomeController {
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping(value = "/")
	public String Index()
	{
		
		//return "home/index";
		return "home/login";
	}
	
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public String LogIn(String user_id, String user_pw,
			HttpServletRequest req) 
	{
		HttpSession session = req.getSession();
		
		UserDTO dto = userRepository.LogIn(user_id, user_pw);
		if(dto == null)
		{
			//·Î±×ÀÎ ¾ÈµÊ.	
			session.setAttribute("login", null);
			return "false";
		}else
		{
			session.setAttribute("login", dto);
			return "true";
		}
		
	}
}

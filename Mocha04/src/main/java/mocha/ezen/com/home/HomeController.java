package mocha.ezen.com.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mocha.ezen.com.schedule.ScheduleDTO;
import mocha.ezen.com.schedule.ScheduleRepository;
import mocha.ezen.com.user.UserDTO;
import mocha.ezen.com.user.UserRepository;

@Controller
public class HomeController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	ScheduleRepository  scheduleRepository;
	
	@RequestMapping(value = "/")
	public String Index(HttpServletRequest request, Model model)
	{
		//로그인 정보를 조회한다.
		UserDTO login = (UserDTO)request.getSession().getAttribute("login");
		if(login != null) {
			ScheduleDTO dto = new ScheduleDTO();
			List<ScheduleDTO> allEvents = scheduleRepository.selectAllEvents(dto);
		    model.addAttribute("scheduleList", allEvents);
			
			return "home/index";
		}
		//return "home/index";
		return "home/login";
	}
	
	@RequestMapping(value = "home/loginOk", method = RequestMethod.POST)
	@ResponseBody
	public String LogIn(String user_id, String user_pw,
			HttpServletRequest request) 
	{
		HttpSession session = request.getSession();
		UserDTO dto = userRepository.LogIn(user_id, user_pw);
		if(dto == null)
		{
			//로그인 안됨.	
			session.setAttribute("login", null);
			System.out.println("false");
			return "false";
		}else
		{
			session.setAttribute("login", dto);
			System.out.println("true");
			return "true";
		}
		
	}
	@RequestMapping(value = "home/logout")
	public String LogOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//session.invalidate();
		session.setAttribute("login", null);
		return "redirect:/";
	}
}

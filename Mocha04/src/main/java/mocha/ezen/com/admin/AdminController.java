package mocha.ezen.com.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("/")
	public String Admin()
	{
		return "admin";
	}
	@RequestMapping("/adminList")
	public String AdminList()
	{
		return "adminList";
	}
}

package mocha.ezen.com.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("")
	public String Admin()
	{
		return "admin/admin";
	}
	@RequestMapping("/adminUserList")
	public String AdminList()
	{
		return "admin/adminUserList";
	}
}

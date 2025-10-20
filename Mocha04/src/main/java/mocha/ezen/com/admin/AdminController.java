package mocha.ezen.com.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import mocha.ezen.com.user.*;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	AdminRepository adminRepository;
	
	@RequestMapping("")
	public String Admin()
	{
		return "admin/admin";
	}
	@RequestMapping(value = "/adminUserList")
	public String AdminUserList(Model model)
	{	
		int total = userRepository.UserCount();
		model.addAttribute("total", total);
		
		List<UserDTO> list = userRepository.UserList();
		for(UserDTO i : list) {
			model.addAttribute("list", list);
		}
		
		return "admin/adminUserList";
	}
	@RequestMapping(value = "/adminUserWrite", method = RequestMethod.POST)
	public String AdminUserWrite(UserDTO dto)
	{
		userRepository.Join(dto);
		//여유가 생길경우 새로생긴 유저 아이디를 받아와서 보냄.
		return "admin/adminUserList";
	}
	
	@RequestMapping(value = "/adminUserView", method = RequestMethod.POST)
	@ResponseBody
	public UserDTO AdminUserView(@RequestParam String user_id) {
		UserDTO dto = userRepository.UserCheck(user_id);
		return dto;
	}
	
	@RequestMapping(value = "/adminUserModify", method = RequestMethod.POST)
	public String AdminUserModify(UserDTO dto) {
		dto = userRepository.ModifyUser(dto);
		return "admin/adminUserList";
	}
}

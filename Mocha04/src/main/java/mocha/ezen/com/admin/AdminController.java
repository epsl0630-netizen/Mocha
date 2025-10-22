package mocha.ezen.com.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import mocha.ezen.com.common.dto.*;
import mocha.ezen.com.departments.*;
import mocha.ezen.com.positions.*;
import mocha.ezen.com.user.*;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	DepartmentRepository departRepository;
	@Autowired
	PositionRepository positionRepository;
	
	@RequestMapping("")
	public String Admin()
	{
		return "admin/admin";
	}
	@RequestMapping(value = "/adminUserList")
	public String AdminUserList( 
			Model model, 
			@RequestParam(required = false)String user_id, 	//list 에서 선택한 user_id
			@RequestParam(defaultValue = "")String keyword, 	//search - keyword
			String dept_id,//search - dept_id
			@RequestParam(defaultValue = "false")boolean authority 	//search - authority
			)
	{	
		if(dept_id != null && (dept_id.equals("") || dept_id.equals("0") ))
		{
			dept_id = null;
		}
		System.out.println("[A]keyword:" + keyword);
		System.out.println("[A]dept_id:" + dept_id);
		System.out.println("[A]authority:" + authority);
		//유저목록 불러오기
		UserSearchDTO searchdto = new UserSearchDTO();
		searchdto.setKeyword(keyword);
		searchdto.setAuthority(authority);
		searchdto.setDept_id(dept_id);
		
		int total = userRepository.UserCount(searchdto);
		model.addAttribute("total", total);
		
		System.out.println(total);
		
		List<UserDTO> userList = userRepository.UserList(searchdto);
		model.addAttribute("userList", userList);
		
		if(user_id != null && user_id != "") {
			model.addAttribute("user_id", user_id);
		}
		//부서목록 불러오기
		List<DepartmentDTO> departList = departRepository.DepartList();
		model.addAttribute("departList", departList);
		//직급목록 불러오기
		List<PositionDTO> positionList = positionRepository.PositionList();
		model.addAttribute("positionList", positionList);
		//search값 보내기
		model.addAttribute("search", searchdto);
		return "admin/adminUserList";
	}
	@RequestMapping(value = "/adminUserWrite", method = RequestMethod.POST)
	public String AdminUserWrite(UserDTO dto, Model model)
	{
		userRepository.Join(dto);
		
		return "redirect:adminUserList?user_id=" + dto.getUser_id();
	}
	
	@RequestMapping(value = "/adminUserView", method = RequestMethod.POST)
	@ResponseBody
	public UserDTO AdminUserView(@RequestParam String user_id) {
		UserDTO dto = userRepository.UserCheck(user_id);
		return dto;
	}
	
	@RequestMapping(value = "/adminUserModify", method = RequestMethod.POST)
	public String AdminUserModify(UserDTO dto, @RequestParam(required = false)String mobile1, @RequestParam(required = false)String mobile2, @RequestParam(required = false)String mobile3) {
		userRepository.ModifyUser(dto);
		//return "admin/adminUserList";
		return "redirect:adminUserList?user_id=" + dto.getUser_id();
	}
	
	@RequestMapping(value = "/adminScheduleList")
	public String AdminScheduleLIst() {
		return "admin/adminScheduleList";
	}
	
	@RequestMapping(value = "/adminApprovalList")
	public String AdminApprovalList() {
		return "admin/adminApprovalList";
	}
}

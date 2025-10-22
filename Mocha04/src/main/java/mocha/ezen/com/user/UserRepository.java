package mocha.ezen.com.user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import mocha.ezen.com.common.dto.UserSearchDTO;
import mocha.ezen.com.departments.DepartmentDTO;
import mocha.ezen.com.user.UserDTO;

@Repository
public class UserRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "user";
	
	//ȸ������
	public boolean Join(UserDTO dto) 
	{	
		if( IdDuplicateCheck(dto.getUser_id()) == true )
		{
			//�ߺ��� ID��.
			return false;
		}
		session.insert(namespace + ".join", dto);
		
		return true;
	}
	
	//���̵� �ߺ��˻�
	public boolean IdDuplicateCheck(String id) {
	/*	
		int count = session.selectOne(namespace + ".idDuplicateCheck", id);
		
		if(count > 0) { return true; }
	*/	
		return false;
	}
	
	public UserDTO LogIn(String id, String pw) {
		UserDTO dto = new UserDTO();
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		
		dto = session.selectOne(namespace + ".logIn", dto);
		return dto;
	}
	
	public int UserCount(UserSearchDTO dto) {
		int total = session.selectOne(namespace + ".total",dto);
		return total;
	}
	
	//������
	public List<UserDTO> UserList(UserSearchDTO dto) {
		
		System.out.println("dept_id:" + dto.getDept_id());
		List<UserDTO> userList = session.selectList(namespace + ".userList", dto);
		return userList;
	}
	
	//�������
	public UserDTO UserCheck(String user_id) {
		UserDTO dto = session.selectOne(namespace + ".userCheck", user_id);
		return dto;
	}
	
	//�����������
	public UserDTO ModifyUser(UserDTO dto) {
		dto = session.selectOne(namespace + ".modify", dto);
		return dto;
	}
	
	public List<DepartmentDTO> deptWithUser() {
		List<DepartmentDTO> deptList = session.selectList(namespace + ".deptWithUser");
		return deptList;
	}
}
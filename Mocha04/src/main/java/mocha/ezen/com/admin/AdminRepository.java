package mocha.ezen.com.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mocha.ezen.com.user.UserDTO;

@Repository
public class AdminRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "admin";
	
	//사원목록
	public List<UserDTO> UserList() {
		List<UserDTO> userList = session.selectList(namespace + ".userList");
		return userList;
	}
}

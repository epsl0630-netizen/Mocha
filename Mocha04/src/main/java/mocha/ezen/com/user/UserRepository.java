package mocha.ezen.com.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mocha.ezen.com.user.UserDTO;

@Repository
public class UserRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "user";
	
	//회원가입
	public boolean Join(UserDTO dto) 
	{	
		if( IdDuplicateCheck(dto.getUser_id()) == true )
		{
			//중복된 ID임.
			return false;
		}
		session.insert(namespace + ".join", dto);
		
		return true;
	}
	
	//아이디 중복검사
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
	
	public int UserCount() {
		int total = session.selectOne(namespace + ".total");
		return total;
	}
}
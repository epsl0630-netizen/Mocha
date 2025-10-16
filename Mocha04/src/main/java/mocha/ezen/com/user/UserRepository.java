package mocha.ezen.com.user;

import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
	//회원가입
	public boolean Join(UserDTO dto) {
		return false;
	}
	
	//아이디 체크
	public boolean IdCheck(String id) {
		return false;
	}
	//로그인
	public boolean Login(String id,String pw) {
		return false;
	}
}

package mocha.ezen.com.user;

import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {
	//ȸ������
	public boolean Join(UserDTO dto) {
		return false;
	}
	
	//���̵� üũ
	public boolean IdCheck(String id) {
		return false;
	}
	//�α���
	public boolean Login(String id,String pw) {
		return false;
	}
}

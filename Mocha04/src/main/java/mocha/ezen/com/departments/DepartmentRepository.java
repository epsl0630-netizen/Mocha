package mocha.ezen.com.departments;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentRepository 
{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "common";
	
	//�μ���ȸ
	public List<DepartmentDTO> DepartList() {
		List<DepartmentDTO> departList = session.selectList(namespace + ".departList");
		
		return departList;
	}
}

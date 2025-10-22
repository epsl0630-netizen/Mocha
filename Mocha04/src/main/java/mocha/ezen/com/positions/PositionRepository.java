package mocha.ezen.com.positions;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PositionRepository {
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "common";
	
	public List<PositionDTO> PositionList() {
		List<PositionDTO> positionList = session.selectList(namespace + ".positionList");
		return positionList;
	}
}

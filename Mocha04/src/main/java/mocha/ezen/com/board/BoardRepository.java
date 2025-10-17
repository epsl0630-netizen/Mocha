package mocha.ezen.com.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mocha.ezen.com.attachment.AttachmentDTO;

@Repository
public class BoardRepository {

	private static final String NS = "board"; // Mapper namespace

	@Autowired
	private SqlSessionTemplate sqlSession;

	// ���
	public List<BoardDTO> findAll(int page, int size, String type, String keyword) {
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("offset", (page - 1) * size);
		p.put("limit", size);
		p.put("type", type);
		p.put("keyword", keyword);
		return sqlSession.selectList(NS + ".selectBoardList", p);
	}

	// ��ü ī��Ʈ(����¡��)
	public long countAll(String type, String keyword) {
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("type", type);
		p.put("keyword", keyword);
		Long cnt = sqlSession.selectOne(NS + ".countBoardList", p);
		return cnt == null ? 0L : cnt;
	}

	// �ܰ�
	public BoardDTO findById(Long id) {
		return sqlSession.selectOne(NS + ".selectBoardById", id);
	}

	// ÷�� ���
	public List<AttachmentDTO> findAttachments(Long boardId) {
		return sqlSession.selectList(NS + ".selectAttachments", boardId);
	}

	// ���
	public Long insert(BoardDTO board) {
		sqlSession.insert(NS + ".insertBoard", board);
		// (auto-increment PK���) mapper���� useGeneratedKeys�� board.board_no ä������ �ص�
		return board.getBoard_no() == null ? null : Long.valueOf(board.getBoard_no());
	}

	// ����
	public int update(BoardDTO board) {
		return sqlSession.update(NS + ".updateBoard", board);
	}

	// ����
	public int delete(Long id) {
		return sqlSession.update(NS + ".deleteBoard", id); // ����Ʈ����Ʈ��� update, �ϵ����Ʈ�� delete
	}

	// ÷�� ����
	public int deleteAttachment(Long attachId) {
		return sqlSession.delete(NS + ".deleteAttachment", attachId);
	}
}

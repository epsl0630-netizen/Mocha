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

	// 목록
	public List<BoardDTO> findAll(int page, int size, String type, String keyword) {
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("offset", (page - 1) * size);
		p.put("limit", size);
		p.put("type", type);
		p.put("keyword", keyword);
		return sqlSession.selectList(NS + ".selectBoardList", p);
	}

	// 전체 카운트(페이징용)
	public long countAll(String type, String keyword) {
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("type", type);
		p.put("keyword", keyword);
		Long cnt = sqlSession.selectOne(NS + ".countBoardList", p);
		return cnt == null ? 0L : cnt;
	}

	// 단건
	public BoardDTO findById(Long id) {
		return sqlSession.selectOne(NS + ".selectBoardById", id);
	}

	// 첨부 목록
	public List<AttachmentDTO> findAttachments(Long boardId) {
		return sqlSession.selectList(NS + ".selectAttachments", boardId);
	}

	// 등록
	public Long insert(BoardDTO board) {
		sqlSession.insert(NS + ".insertBoard", board);
		// (auto-increment PK라면) mapper에서 useGeneratedKeys로 board.board_no 채워지게 해둠
		return board.getBoard_no() == null ? null : Long.valueOf(board.getBoard_no());
	}

	// 수정
	public int update(BoardDTO board) {
		return sqlSession.update(NS + ".updateBoard", board);
	}

	// 삭제
	public int delete(Long id) {
		return sqlSession.update(NS + ".deleteBoard", id); // 소프트딜리트라면 update, 하드딜리트면 delete
	}

	// 첨부 삭제
	public int deleteAttachment(Long attachId) {
		return sqlSession.delete(NS + ".deleteAttachment", attachId);
	}
}

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
	public List<BoardDTO> findAll(int page, int size, String type, String keyword, String kind) {
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("offset", (page - 1) * size);
		p.put("limit", size);
		p.put("type", type);
		p.put("keyword", keyword);
		p.put("kind", kind);
		// �� corrected ID
		return sqlSession.selectList(NS + ".selectBoardList", p);
	}

	// ��ü ī��Ʈ(����¡��)
	public long countAll(String type, String keyword) {
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("type", type);
		p.put("keyword", keyword);
		// �� corrected ID (Resolved the IllegalArgumentException)
		Long cnt = sqlSession.selectOne(NS + ".countBoardList", p);
		return cnt == null ? 0L : cnt;
	}

	// �ܰ�
	public BoardDTO findById(Long id) {
		// �� corrected ID
		return sqlSession.selectOne(NS + ".selectBoardById", id);
	}

	// ÷�� ���
	public List<AttachmentDTO> findAttachments(Long boardId) {
		return sqlSession.selectList(NS + ".findAttachByBoard", boardId);
	}

	// ���
	public Long insert(BoardDTO board) {
		// �� corrected ID
		sqlSession.insert(NS + ".insertBoard", board);
		return board.getBoard_no() == null ? null : Long.valueOf(board.getBoard_no());
	}

	// ����
	public int update(BoardDTO board) {
		// �� corrected ID
		return sqlSession.update(NS + ".updateBoard", board);
	}

	public int delete(Long id) {
		return sqlSession.update(NS + ".deleteBoard", id);
	}
//	// =========================================================================
//	// 댓글 관련 메서드 추가
//	// =========================================================================
//
//	/**
//	 * 댓글 등록 (ReplyDTO를 사용하고, Mapper ID는 insertReply를 사용한다고 가정)
//	 * 
//	 * @param reply 댓글 DTO (ReplyDTO)
//	 * @return INSERT된 레코드 수
//	 */
//	public int insertReply(ReplyDTO reply) {
//		// NS_REPLY 네임스페이스를 사용하거나, BoardMapper에 쿼리를 넣었다면 NS를 사용하세요.
//		// 여기서는 BoardMapper.xml에 쿼리를 넣었다고 가정하고 NS를 사용합니다.
//		return sqlSession.insert(NS + ".insertReply", reply);
//	}
//
//	/**
//	 * 특정 게시글의 댓글 목록 조회 (ReplyDTO를 사용하고, Mapper ID는 findRepliesByBoardNo를 사용한다고 가정)
//	 * 
//	 * @param boardNo 게시글 번호
//	 * @return 해당 게시글에 달린 댓글 목록
//	 */
//	public List<ReplyDTO> findRepliesByBoardNo(Long boardNo) {
//		// NS_REPLY 네임스페이스를 사용하거나, BoardMapper에 쿼리를 넣었다면 NS를 사용하세요.
//		// 여기서는 BoardMapper.xml에 쿼리를 넣었다고 가정하고 NS를 사용합니다.
//		return sqlSession.selectList(NS + ".findRepliesByBoardNo", boardNo);
//	}
}
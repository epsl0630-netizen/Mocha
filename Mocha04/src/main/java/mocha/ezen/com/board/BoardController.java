package mocha.ezen.com.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import javax.servlet.http.HttpSession;

import mocha.ezen.com.attachment.AttachmentDTO;
import mocha.ezen.com.user.UserDTO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardRepository boardRepository;

	// =========================================================================
	// 1. �Խñ� ��� ǥ�� (GET)
	// =========================================================================
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,
			@RequestParam(required = false, defaultValue = "") String type,
			@RequestParam(required = false, defaultValue = "") String keyword,
			@RequestParam(required = false) String kind, Model model) {

		// 1. ��ü �Խñ� �� ��ȸ (MyBatis ���� �ذ�� ID ���)
		long totalCount = boardRepository.countAll(type, keyword);

		// 2. ���� �������� �Խñ� ��� ��ȸ
		List<BoardDTO> items = boardRepository.findAll(page, size, type, keyword, kind);

		// 3. �𵨿� ������ �߰�
		model.addAttribute("items", items);
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("totalPages", (int) Math.ceil((double) totalCount / size));
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("kind", kind);

		return "board/boardList";
	}

	// =========================================================================
	// 2. �Խñ� �ۼ� �� ǥ�� (GET)
	// =========================================================================
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String writeForm(Model model) {
		return "board/boardWrite";
	}

	// =========================================================================
	// 3. �Խñ� �ۼ� ó�� (POST) - 405 ���� �ذ�
	// =========================================================================
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String writeSubmit(BoardDTO boardDto, @RequestParam(value = "files", required = false) MultipartFile[] files,
			HttpSession session) {

		// 1. DB�� �Խñ� ���� �� PK(board_no) �ޱ�
		// *Attachment logic omitted, only board insert shown*

		UserDTO user = (UserDTO) session.getAttribute("login");

		boardDto.setUser_id(user.getUser_id());
		Long newBoardNo = boardRepository.insert(boardDto);

		// 2. ���� �Ϸ� ��, ��� �ۼ��� ���� �� ���� �������� �����̷�Ʈ
		if (newBoardNo != null) {
			return "redirect:/board/boardView?board_no=" + newBoardNo;
		} else {
			return "redirect:/board/boardWrite";
		}
	}

	// =========================================================================
	// 4. �Խñ� �� ���� (GET)
	// =========================================================================
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public String view(@RequestParam("board_no") Long boardNo, Model model) {

		// 1. �� ��ȣ�� �̿��� �Խñ� ���� ��ȸ
		BoardDTO item = boardRepository.findById(boardNo);

		// 2. ÷�� ���� ��� ��ȸ
		List<AttachmentDTO> atts = boardRepository.findAttachments(boardNo);

		// 3. �𵨿� ������ �߰�
		model.addAttribute("item", item);
		model.addAttribute("atts", atts);

		return "board/boardView";
	}

	// =========================================================================
	// 5. �Խñ� ���� �� ǥ�� (GET)
	// =========================================================================
	@RequestMapping(value = "/boardModify", method = RequestMethod.GET)
	public String modifyForm(@RequestParam("id") Long boardNo, Model model) {
		model.addAttribute("item", boardRepository.findById(boardNo));
		model.addAttribute("atts", boardRepository.findAttachments(boardNo));

		return "board/boardModify";
	}

	// =========================================================================
	// 6. �Խñ� ���� ó�� (POST)
	// =========================================================================
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String modifySubmit(BoardDTO boardDto) {

		boardRepository.update(boardDto);

		// ���� �Ϸ� ��, ������ ���� �� ���� �������� �����̷�Ʈ
		return "redirect:/board/boardView?board_no=" + boardDto.getBoard_no();
	}

	// =========================================================================
	// 7. 게시글 삭제 처리 (POST)
	// =========================================================================
	@RequestMapping(value = "/boarDdelete", method = RequestMethod.POST)
	public String deleteSubmit(@RequestParam("board_no") Long boardNo, // JSP에서 넘어오는 파라미터 이름은 board_no입니다.
			HttpSession session, RedirectAttributes rttr) { // 리다이렉트 시 메시지 전달을 위해 추가

		UserDTO user = (UserDTO) session.getAttribute("login");

		// 1. 로그인 여부 확인
		if (user == null) {
			rttr.addFlashAttribute("errorMsg", "로그인 후 이용해 주세요.");
			return "redirect:/user/login"; // 또는 상세 보기 페이지로 리다이렉트
		}

		// 2. 게시글 정보 조회 (작성자 확인용)
		BoardDTO item = boardRepository.findById(boardNo);

		// 3. 작성자 본인 확인 및 삭제
		if (item != null && item.getUser_id().equals(user.getUser_id())) {
			try {
				boardRepository.delete(boardNo); // DB 삭제 처리
				rttr.addFlashAttribute("msg", "✅ 게시글이 삭제되었습니다.");
			} catch (Exception e) {
				rttr.addFlashAttribute("errorMsg", "❌ 삭제 처리 중 오류가 발생했습니다.");
				// 로깅 필요: System.err.println("삭제 오류: " + e.getMessage());
			}
		} else if (item != null) {
			// 작성자가 아닌 경우
			rttr.addFlashAttribute("errorMsg", "⚠️ 삭제 권한이 없습니다.");
		} else {
			// 게시글이 없는 경우
			rttr.addFlashAttribute("errorMsg", "⚠️ 존재하지 않는 게시글입니다.");
		}

		// 4. 게시글 목록 페이지로 리다이렉트
		return "redirect:/board/boardList";
	}
}
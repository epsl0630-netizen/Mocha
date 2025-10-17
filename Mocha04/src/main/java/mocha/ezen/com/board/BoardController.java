package mocha.ezen.com.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import mocha.ezen.com.board.*;
//import mocha.ezen.com.attachment.AttachmentDTO;
//import mocha.ezen.com.user.UserDTO;

@Controller
@RequestMapping("/board")
public class BoardController {

	// /board/ → /board/list로 보내기 (선택)
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public String BoardView() {
		return "board/boardView";
	}

	// 목록 JSP 열기 (데이터 없이 화면만)
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String BoardList() {
		return "board/boardList";
	}
	
	//수정
	@RequestMapping(value = "/boardModify", method = RequestMethod.GET)
	public String BoardModify() {
		return "board/boardModify";
	}
	
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String BoardWrite() {
		return "board/boardWrite";
	}

//	private final BoardService boardService;
//
//	@Autowired
//	// 생성자 주입 (Lombok 없이)
//	public BoardController(BoardService boardService) {
//		this.boardService = boardService;
//	}
//
//	// 목록
//
//	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
//	public String BoardList(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,
//			@RequestParam(required = false) String type, // title | content | writer
//			@RequestParam(required = false) String keyword, Model model) {
//
//		Page<BoardDTO> result = boardService.getList(page, size, type, keyword);
//
//		model.addAttribute("list", result.getContent());
//		model.addAttribute("page", result.getPage());
//		model.addAttribute("size", result.getSize());
//		model.addAttribute("totalPages", result.getTotalPages());
//		model.addAttribute("totalCount", result.getTotalCount());
//		model.addAttribute("type", type);
//		model.addAttribute("keyword", keyword);
//
//		return "board/boardList";
//	}
//
//	// 상세
//
//	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
//	public String read(@PathVariable("id") Long id, Model model) {
//		BoardDTO board = boardService.getOne(id);
//		List<AttachmentDTO> files = boardService.getAttachments(id);
//
//		model.addAttribute("board", board);
//		model.addAttribute("files", files);
//		return "board/read";
//	}
//
//	// 작성 품
//
//	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
//	public String writeForm(Model model) {
//		model.addAttribute("board", new BoardDTO());
//		return "board/write";
//	}
//
//	// 작성처리
//
//	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
//	public String boardWrite(@ModelAttribute("board") BoardDTO board, BindingResult bindingResult,
//			@RequestParam(value = "files", required = false) List<MultipartFile> files, HttpSession session,
//			Model model) {
//
//		if (bindingResult.hasErrors()) {
//			return "board/write";
//		}
//
//		// 로그인 사용자 정보 (세션 키는 프로젝트에 맞게 사용)
//		UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
//		if (loginUser != null) {
//			// 로그인한 사용자의 아이디를 작성자로 설정
//			board.setUser_id(loginUser.getUser_id());
//		}
//
//		Long newId = boardService.create(board, files);
//		return "/board/" + newId;
//	}
//
//	// 수정 폼
//
//	@RequestMapping(value = "/{id}/edit", method = RequestMethod.GET)
//	public String editForm(@PathVariable("id") Long id, Model model) {
//		BoardDTO board = boardService.getOne(id);
//		List<AttachmentDTO> files = boardService.getAttachments(id);
//
//		model.addAttribute("board", board);
//		model.addAttribute("files", files);
//		return "board/edit";
//	}
//
//	// 수정 처리
//
//	@RequestMapping(value = "/board/boardModify", method = RequestMethod.POST)
//	public String BoardModify(@PathVariable("id") Long id, @ModelAttribute("board") BoardDTO board,
//			BindingResult bindingResult,
//			@RequestParam(value = "addFiles", required = false) List<MultipartFile> addFiles,
//			@RequestParam(value = "deleteFileIds", required = false) List<Long> deleteFileIds) {
//
//		if (bindingResult.hasErrors())
//			return "board/edit";
//
//		board.setBoard_no(String.valueOf(id)); 
//		boardService.update(board, addFiles, deleteFileIds);
//
//		return "redirect:/board/" + id;
//	}
//
//	// 삭제
//
//	@RequestMapping(value = "board/boarddelete", method = RequestMethod.POST)
//	public String boardDelete(@PathVariable("id") Long id) {
//		boardService.delete(id);
//		return "redirect:/board/list";
//	}
//
//	// 첨부 단건 삭제 (AJAX)
//
//	@ResponseBody
//	@RequestMapping(value = "/board/boarddelete", method = RequestMethod.POST)
//	public String boardk(@PathVariable("id") Long postId, @PathVariable("attachId") Long attachId) {
//		boardService.deleteAttachment(postId, attachId);
//		return "OK";
//	}
//
//	// 목록 JSON (AJAX)
//
//	@ResponseBody
//	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
//	public Page<BoardDTO> apiList(@RequestParam(defaultValue = "1") int page,
//			@RequestParam(defaultValue = "10") int size, @RequestParam(required = false) String type,
//			@RequestParam(required = false) String keyword) {
//		return boardService.getList(page, size, type, keyword);
//	}
//
//	// 간단한 페이징 컨테이너 (뷰/JSON 공용)
//	public static class Page<T> {
//		private List<T> content;
//		private int page;
//		private int size;
//		private int totalPages;
//		private long totalCount;
//
//		public Page() {
//		}
//
//		public Page(List<T> content, int page, int size, int totalPages, long totalCount) {
//			this.content = content;
//			this.page = page;
//			this.size = size;
//			this.totalPages = totalPages;
//			this.totalCount = totalCount;
//		}
//
//		public List<T> getContent() { return content; }	
//		public int getPage() { return page;	}	
//		public int getSize() { return size; }
//		public int getTotalPages() { return totalPages;	}		
//		public long getTotalCount() { return totalCount; }
//		
//		public void setContent(List<T> content) { this.content = content; }
//		public void setPage(int page) { this.page = page; }
//		public void setSize(int size) { this.size = size; }
//		public void setTotalPages(int totalPages) { this.totalPages = totalPages; }
//		public void setTotalCount(long totalCount) { this.totalCount = totalCount; }
//		
//	}
//
//	public static interface BoardService {
//		Page<BoardDTO> getList(int page, int size, String type, String keyword);
//		BoardDTO getOne(Long id);
//		List<AttachmentDTO> getAttachments(Long boardId);
//		Long create(BoardDTO board, List<MultipartFile> files);
//		void update(BoardDTO board, List<MultipartFile> addFiles, List<Long> deleteFileIds);
//		void delete(Long id);
//		void deleteAttachment(Long postId, Long attachId);
//	}
}

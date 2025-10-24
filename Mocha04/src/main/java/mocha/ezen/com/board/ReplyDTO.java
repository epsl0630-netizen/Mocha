//package mocha.ezen.com.board;
//
//import java.time.LocalDateTime;
//
//public class ReplyDTO {
//
//	// DB 컬럼명과 일치하도록 수정
//	private Long reply_no; // 댓글 번호 (PK)
//	private String reply_note; // 댓글 내용 (DB: reply_note)
//	private Long board_no; // 게시글 번호 (FK)
//	private String user_id; // 작성자 ID (FK)
//
//	// 타임스탬프
//	private LocalDateTime created_at; // 생성일시
//	private LocalDateTime delete_at; // 삭제일시 (soft delete용)
//
//	public Long getReply_no() {
//		return reply_no;
//	}
//
//	public String getReply_note() {
//		return reply_note;
//	}
//
//	public Long getBoard_no() {
//		return board_no;
//	}
//
//	public String getUser_id() {
//		return user_id;
//	}
//
//	public LocalDateTime getCreated_at() {
//		return created_at;
//	}
//
//	public LocalDateTime getDelete_at() {
//		return delete_at;
//	}
//
//	public void setReply_no(Long reply_no) {
//		this.reply_no = reply_no;
//	}
//
//	public void setReply_note(String reply_note) {
//		this.reply_note = reply_note;
//	}
//
//	public void setBoard_no(Long board_no) {
//		this.board_no = board_no;
//	}
//
//	public void setUser_id(String user_id) {
//		this.user_id = user_id;
//	}
//
//	public void setCreated_at(LocalDateTime created_at) {
//		this.created_at = created_at;
//	}
//
//	public void setDelete_at(LocalDateTime delete_at) {
//		this.delete_at = delete_at;
//	}
//
//}
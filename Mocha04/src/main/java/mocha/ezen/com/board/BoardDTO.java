package mocha.ezen.com.board;

public class BoardDTO {
	private String board_no;	// 게시글 번호
	private String board_title; // 게시글 제목
	private String board_note;  // 게시글 본문
	private String board_kind;  // 구분
	private String created_at;  // 생성일시
	private String updated_at;  // 수정일시
	private String deleted_at;  // 삭제일시
	private String user_id;     // 사원번호
	private String alarm_no;    // 알림번호
	
	public String getBoard_no()    { return board_no;    }
	public String getBoard_title() { return board_title; }
	public String getBoard_note()  { return board_note;  }
	public String getBoard_kind()  { return board_kind;  }
	public String getCreated_at()  { return created_at;  }
	public String getUpdated_at()  { return updated_at;  }
	public String getDeleted_at()  { return deleted_at;  }
	public String getUser_id()     { return user_id; 	 }
	public String getAlarm_no()    { return alarm_no;	 }
	
	public void setBoard_no(String board_no) 	   { this.board_no = board_no;       }
	public void setBoard_title(String board_title) { this.board_title = board_title; }
	public void setBoard_note(String board_note)   { this.board_note = board_note;   }
	public void setBoard_kind(String board_kind)   { this.board_kind = board_kind;   }
	public void setCreated_at(String created_at)   { this.created_at = created_at;   }
	public void setUpdated_at(String updated_at)   { this.updated_at = updated_at;   }
	public void setDeleted_at(String deleted_at)   { this.deleted_at = deleted_at;   }
	public void setUser_id(String user_id) 		   { this.user_id = user_id; 		 } 
	public void setAlarm_no(String alarm_no) 	   { this.alarm_no = alarm_no;       }
	
	
}

package mocha.ezen.com.board;

public class BoardDTO {
	private String board_no;	// �Խñ� ��ȣ
	private String board_title; // �Խñ� ����
	private String board_note;  // �Խñ� ����
	private String board_kind;  // ����
	private String created_at;  // �����Ͻ�
	private String updated_at;  // �����Ͻ�
	private String deleted_at;  // �����Ͻ�
	private String user_id;     // �����ȣ
	private String alarm_no;    // �˸���ȣ
	
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

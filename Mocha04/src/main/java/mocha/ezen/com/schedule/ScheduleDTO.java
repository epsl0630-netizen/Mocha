package mocha.ezen.com.schedule;

public class ScheduleDTO {
	private String schedule_no;   // ����
	private String title;		  // ����
	private String schedule_kind; // ��������
	private String start_at; 	  // �����Ͻ�
	private String end_at;		  // �����Ͻ�
	private String updated_at;    // �����Ͻ�
	private String deleted_at;	  // �����Ͻ�
	private String user_id;	 	  // ��� ��ȣ
	
	
	public String getSchedule_no()	 { return schedule_no;	 }
	public String getTitle()		 { return title;		 }
	public String getSchedule_kind() { return schedule_kind; }
	public String getStart_at()		 { return start_at;		 }
	public String getEnd_at()		 { return end_at;		 }
	public String getUpdated_at()	 { return updated_at;	 }
	public String getDeleted_at()	 { return deleted_at;	 }
	public String getUser_id()		 { return user_id;		 }
	
	public void setSchedule_no(String schedule_no)	   { this.schedule_no = schedule_no;	 }
	public void setTitle(String title)				   { this.title = title;				 }
	public void setSchedule_kind(String schedule_kind) { this.schedule_kind = schedule_kind; }
	public void setStart_at(String start_at)	       { this.start_at = start_at;			 }
	public void setEnd_at(String end_at) 		 	   { this.end_at = end_at;				 }
	public void setUpdated_at(String updated_at) 	   { this.updated_at = updated_at;		 }
	public void setDeleted_at(String deleted_at) 	   { this.deleted_at = deleted_at;		 }
	public void setUser_id(String user_id) 		 	   { this.user_id = user_id; 			 }
	
	
	
	
	
}

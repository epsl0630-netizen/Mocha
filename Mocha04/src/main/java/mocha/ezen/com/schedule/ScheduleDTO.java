package mocha.ezen.com.schedule;

public class ScheduleDTO {
	private String schedule_no;   // ����
	private String schedule_title;// ����
	private String schedule_kind; // ��������
	private String start_at; 	  // �����Ͻ�
	private String end_at;		  // �����Ͻ�
	private String updated_at;    // �����Ͻ�
	private String deleted_at;	  // �����Ͻ�
	private String created_at;	  // ����Ͻ�
	private String user_id;	 	  // ��� ��ȣ
	private String schedule_note; // ����
	
	private String name;	 	  // �ۼ����̸�
	private String dept_name;	  // �μ��̸�
	
	
	
	

	public String getSchedule_no()	 { return schedule_no;	 }
	public String getTitle()		 { return schedule_title;}
	public String getSchedule_kind() { return schedule_kind; }
	public String getStart_at()		 { return start_at;		 }
	public String getEnd_at()		 { return end_at;		 }
	public String getUpdated_at()	 { return updated_at;	 }
	public String getDeleted_at()	 { return deleted_at;	 }
	public String getUser_id()		 { return user_id;		 }
	public String getSchedule_note() { return schedule_note; }
	public String getSchedule_title(){return schedule_title; }
	public String getCreated_at() 	 {return created_at;	 }
	
	public String getName() 		 {return name;		 	 }
	public String getDept_name() 	 {return dept_name;		 }
	
	public void setSchedule_no(String schedule_no)		   	{ this.schedule_no = schedule_no;	 	}
	public void setTitle(String title)				   		{ this.schedule_title = title;	     	}
	public void setSchedule_kind(String schedule_kind) 		{ this.schedule_kind = schedule_kind; 	}
	public void setStart_at(String start_at)	       		{ this.start_at = start_at;			 	}
	public void setEnd_at(String end_at) 		 	   		{ this.end_at = end_at;				 	}
	public void setUpdated_at(String updated_at) 	   		{ this.updated_at = updated_at;		 	}
	public void setDeleted_at(String deleted_at) 	   		{ this.deleted_at = deleted_at;		 	}
	public void setUser_id(String user_id) 					{ this.user_id = user_id; 			 	}
	public void setSchedule_note(String schedule_note) 		{ this.schedule_note = schedule_note; 	}
	public void setSchedule_title(String schedule_title) 	{this.schedule_title = schedule_title; 	}
	public void setCreated_at(String created_at) 			{this.created_at = created_at;			}
	
	public void setName(String name) 				 		{this.name = name;						}
	public void setDept_name(String dept_name) 				{this.dept_name = dept_name;			}
	
	
	
}

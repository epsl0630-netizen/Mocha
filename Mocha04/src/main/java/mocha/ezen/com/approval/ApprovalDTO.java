package mocha.ezen.com.approval;

public class ApprovalDTO 
{
	private String approval_no;          // ���ڰ��� ��ȣ
	private String approval_title;		 // ���ڰ����
	private String approval_note;		 // ���ڰ��纻��
	private String approval_kind;		 // ��������
	private String approval_status;		 // �������
	private String created_at;			 // �ۼ��Ͻ� 
	private String updated_at;			 // �����Ͻ�
	private String user_id;				 // �����ȣ
	private String parent_approval_no;   // �θ�����ȣ
	
	public String getApproval_no()     	  { return approval_no;   	   }
	public String getApproval_title() 	  { return approval_title;	   }
	public String getApproval_note() 	  { return approval_note; 	   }
	public String getApproval_kind() 	  { return approval_kind; 	   }
	public String getApproval_status()	  { return approval_status;    }
	public String getCreated_at() 		  {	return created_at;		   }
	public String getUpdated_at()		  { return updated_at;		   }
	public String getUser_id()			  { return user_id; 		   }
	public String getParent_approval_no() { return parent_approval_no; }
	
		
	public void setApproval_no(String approval_no) 			     { this.approval_no = approval_no;				 }
	public void setApproval_title(String approval_title) 		 { this.approval_title = approval_title;   		 }
	public void setApproval_note(String approval_note) 			 { this.approval_note = approval_note; 			 }
	public void setApproval_kind(String approval_kind) 		     { this.approval_kind = approval_kind; 			 }
	public void setApproval_status(String approval_status)	     { this.approval_status = approval_status;	     }
	public void setCreated_at(String created_at) 				 { this.created_at = created_at; 				 }
	public void setUpdated_at(String updated_at) 				 { this.updated_at = updated_at; 				 }
	public void setUser_id(String user_id) 						 { this.user_id = user_id; 					   	 }
	public void setParent_approval_no(String parent_approval_no) { this.parent_approval_no = parent_approval_no; }
	
	
	
}

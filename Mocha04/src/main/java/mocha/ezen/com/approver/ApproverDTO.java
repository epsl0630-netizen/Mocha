package mocha.ezen.com.approver;

public class ApproverDTO {
	private String approver_no; 	 // �����ڹ�ȣ
	private String approval_no;		 // ���ڰ����ȣ
	private String approval_order;   // ����ܰ�
	private String approval_status;	 // �������
	private String approval_at;		 // �����Ͻ�
	private String approval_comment; // �ǰ�
	private String user_id;			 // �����ȣ
	
	public String getApprover_no()		 { return approver_no;		 }
	public String getApproval_no()		 { return approval_no;		 }
	public String getApproval_order()	 { return approval_order;	 }
	public String getApproval_status()	 { return approval_status;	 }
	public String getApproval_at()		 { return approval_at;		 } 
	public String getApproval_comment()	 { return approval_comment;	 }
	public String getUser_id()			 { return user_id;			 }
	
	public void setApprover_no(String approver_no)			 { this.approver_no = approver_no;			 }
	public void setApproval_no(String approval_no)			 { this.approval_no = approval_no;			 }
	public void setApproval_order(String approval_order)	 { this.approval_order = approval_order;	 }
	public void setApproval_status(String approval_status)	 { this.approval_status = approval_status;	 }
	public void setApproval_at(String approval_at)			 { this.approval_at = approval_at;			 }
	public void setApproval_comment(String approval_comment) { this.approval_comment = approval_comment; }
	public void setUser_id(String user_id)					 { this.user_id = user_id;					 }
	
	
	
	
}

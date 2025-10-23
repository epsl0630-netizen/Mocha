package mocha.ezen.com.approval;

import mocha.ezen.com.approver.ApproverDTO;
import mocha.ezen.com.departments.DepartmentDTO;
import mocha.ezen.com.user.UserDTO;

public class ApprovalDTO 
{
	private String approval_no;          // 전자결재 번호
	private String approval_title;		 // 전자결재명
	private String approval_note;		 // 전자결재본문
	private String approval_kind;		 // 결재종류
	private String approval_status;		 // 결재상태
	private String created_at;			 // 작성일시 
	private String updated_at;			 // 수정일시
	private String user_id;				 // 사원번호
	private String parent_approval_no;   // 부모결재번호
	private String name;                 // 유저이름
	private String user_rank;            // 직급
	private String dept_name;            // 부서이름
	private String end_at;               // 마감일
    private UserDTO user;                //useㄱㅇ썌  
    private DepartmentDTO department;    //부서DTO
	private ApproverDTO approverDTO;	 // 결재선DTO
	
	public String getApproval_no()     	  { return approval_no;   	   }
	public String getApproval_title() 	  { return approval_title;	   }
	public String getApproval_note() 	  { return approval_note; 	   }
	public String getApproval_kind() 	  { return approval_kind; 	   }
	public String getApproval_status()	  { return approval_status;    }
	public String getCreated_at() 		  {	return created_at;		   }
	public String getUpdated_at()		  { return updated_at;		   }
	public String getUser_id()			  { return user_id; 		   }
	public String getParent_approval_no() { return parent_approval_no; }
	public ApproverDTO getApproverDTO()   { return approverDTO;		   }
		
	public void setApproval_no(String approval_no) 			     { this.approval_no = approval_no;				 }
	public void setApproval_title(String approval_title) 		 { this.approval_title = approval_title;   		 }
	public void setApproval_note(String approval_note) 			 { this.approval_note = approval_note; 			 }
	public void setApproval_kind(String approval_kind) 		     { this.approval_kind = approval_kind; 			 }
	public void setApproval_status(String approval_status)	     { this.approval_status = approval_status;	     }
	public void setCreated_at(String created_at) 				 { this.created_at = created_at; 				 }
	public void setUpdated_at(String updated_at) 				 { this.updated_at = updated_at; 				 }
	public void setUser_id(String user_id) 						 { this.user_id = user_id; 					   	 }
	public void setParent_approval_no(String parent_approval_no) { this.parent_approval_no = parent_approval_no; }
	public void setApproverDTO(ApproverDTO approverDTO) 		 { this.approverDTO = approverDTO;				 }
	

	

    
    public UserDTO getUser() { return user; }
    public void setUser(UserDTO user) { this.user = user; }

    

	public DepartmentDTO getDepartment() { return department; }
	public void setDepartment(DepartmentDTO department) { this.department = department; } 
	

	
	public String getEnd_at() {
		return end_at;
	}
	public void setEnd_at(String end_at) {
		this.end_at = end_at;
	}
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	
}

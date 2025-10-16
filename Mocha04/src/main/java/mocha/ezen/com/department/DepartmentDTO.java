package mocha.ezen.com.department;

public class DepartmentDTO {
	private String dept_id;    // 부서
	private String dept_name;  // 부서명
	private String created_at; // 생성일시
	private String updated_at; // 수정일시
	private String user_id;    // 사원번호
	
	
	public String getDept_id()    { return dept_id;    }
	public String getDept_name()  { return dept_name;  }
	public String getCreated_at() { return created_at; }
	public String getUpdated_at() { return updated_at; }
	public String getUser_id() 	  { return user_id;    }
	
	public void setDept_id(String dept_id) 	 	 { this.dept_id = dept_id;       }
	public void setDept_name(String dept_name)   { this.dept_name = dept_name;   }
	public void setCreated_at(String created_at) { this.created_at = created_at; }
	public void setUpdated_at(String updated_at) { this.updated_at = updated_at; }
	public void setUser_id(String user_id) 		 { this.user_id = user_id;   	 }
	
	
	
	
	
	
}

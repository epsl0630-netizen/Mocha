package mocha.ezen.com.common.dto;

public class UserSearchDTO extends SearchDTO{
	private String dept_id;
	private boolean authority;
	
	public String getDept_id() 		{return dept_id;	}
	public boolean isAuthority() 	{return authority;	}
	
	public void setDept_id(String dept_id) 		{this.dept_id = dept_id;	}
	public void setAuthority(boolean authority) {this.authority = authority;}
	
}

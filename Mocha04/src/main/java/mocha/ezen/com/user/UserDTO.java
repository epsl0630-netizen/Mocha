package mocha.ezen.com.user;

public class UserDTO {
	private String user_id;	       // 사원번호
	private String user_pw;		   // 비밀번호
	private String name;		   // 사원이름
	private String user_gender;	   // 성별
	private String is_active;	   // 활성 여부
	private String dept_id;		   // 부서
	private String email;		   // 이메일
	private String mobile;		   // 휴대전화
	private String user_birth;	   // 생년월일
	private String created_at;	   // 가입일시
	private String updated_at; 	   // 수정일시
	private String user_addr;	   // 사원주소
	private String user_file_name; // 사원프로필 
	private String user_photo;	   // 사원사진
	private String user_rank;	   // 직급
	private boolean authority;	   // 권한
	
	//참조키로 가져오는 컬럼
	private String dept_name;		// 부서 이름
	private String position_name;	//
	
	
	//getter & setter
	public String getUser_id()		  { return user_id;		   }
	public String getUser_pw()		  { return user_pw;		   }
	public String getName() 		  { return name;		   }
	public String getUser_gender()	  { return user_gender;	   }
	public String getIs_active()	  { return is_active;	   }
	public String getDept_id()		  { return dept_id;		   }
	public String getEmail()		  { return email;		   }
	public String getMobile()		  { return mobile;		   }
	public String getUser_birth()	  { return user_birth;     }
	public String getCreated_at()	  { return created_at;	   }
	public String getUpdated_at()	  { return updated_at; 	   }
	public String getUser_addr()	  { return user_addr; 	   }
	public String getUser_file_name() { return user_file_name; }
	public String getUser_photo() 	  { return user_photo; 	   }
	public String getUser_rank() 	  { return user_rank; 	   }
	public boolean isAuthority() 	  { return authority;	   }
	
	public String getDept_name() 	  {return dept_name;	   }
	public String getPosition_name()  {return position_name;   }
	
	public void setUser_id(String user_id)				 { this.user_id = user_id;				 }
	public void setUser_pw(String user_pw)				 { this.user_pw = user_pw; 			 	 }
	public void setName(String name)					 { this.name = name;					 }
	public void setUser_gender(String user_gender)		 { this.user_gender = user_gender; 		 }
	public void setIs_active(String is_active)			 { this.is_active = is_active;			 }
	public void setDept_id(String dept_id)				 { this.dept_id = dept_id;				 }
	public void setEmail(String email)					 { this.email = email;					 }
	public void setMobile(String mobile)				 { this.mobile = mobile;				 }
	public void setUser_birth(String user_birth)		 { this.user_birth = user_birth; 	 	 }
	public void setCreated_at(String created_at)		 { this.created_at = created_at;		 }
	public void setUpdated_at(String updated_at)		 { this.updated_at = updated_at;		 }
	public void setUser_addr(String user_addr)			 { this.user_addr = user_addr;			 }
	public void setUser_file_name(String user_file_name) { this.user_file_name = user_file_name; }
	public void setUser_photo(String user_photo)		 { this.user_photo = user_photo;  		 }
	public void setUser_rank(String user_rank)			 { this.user_rank = user_rank;			 }
	public void setAuthority(boolean authority) 		 { this.authority = authority;			 }	
	
	public void setDept_name(String dept_name) 			 {this.dept_name = dept_name;			 }
	public void setPosition_name(String position_name) 	 {this.position_name = position_name;	 }
	
	
	
	//method
	@Override
	public String toString() {
		return "UserDTO [user_id : " + user_id + ", user_pw : " + user_pw + ", name : " + name + ", user_gender : "
				+ user_gender + ", is_active : " + is_active + ", dept_id : " + dept_id + ", email : " + email
				+ ", mobile : " + mobile + ", user_birth : " + user_birth + ", created_at : " + created_at
				+ ", updated_at : " + updated_at + ", user_addr : " + user_addr + ", user_file_name : " + user_file_name
				+ ", user_photo : " + user_photo + ", user_rank : " + user_rank + "]";
	}
	
}	

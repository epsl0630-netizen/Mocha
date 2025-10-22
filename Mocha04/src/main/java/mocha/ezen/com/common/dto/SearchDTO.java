package mocha.ezen.com.common.dto;

public class SearchDTO {
	private String sort;		//검색종류
	private String keyword;		//검색어
	
	private String login_id;	//로그인 아이디
	
	private PageDTO pagedto;	//페이징

	public String getSort() 	{return sort;		}
	public String getKeyword() 	{return keyword;	}
	public String getLogin_id() {return login_id;	}
	public PageDTO getPagedto() {return pagedto;	}
	
	public void setSort(String sort) 			{this.sort = sort;			}
	public void setKeyword(String keyword) 		{this.keyword = keyword;	}
	public void setLogin_id(String login_id) 	{this.login_id = login_id;	}
	public void setPagedto(PageDTO pagedto) 	{this.pagedto = pagedto;	}
	
	
	
}

package mocha.ezen.com.common.dto;

public class PageDTO {
	private int displayContentInPage = 15;	//화면에 보이는 컨텐츠 갯수
	private int displayPageInPage = 10;	//화면에 보이는 페이지 갯수
	
	private int curpageNo;		//현재 페이지 번호
	private int totalCount;		//총 게시글 갯수
	
	private int startPageNo;	//시작 페이지 번호
	private int endPageNo;		//끝 페이지 번호
	
	private boolean prev;		//이전 버튼
	private boolean next;		//다음 버튼
	
	//getter setter
	public int getDisplayContentInPage() {return displayContentInPage;}
	public int getDisplayPageInPage() {return displayPageInPage;}
	public int getCurpageNo() {return curpageNo;}
	public int getTotalCount() {return totalCount;}
	public int getStartPageNo() {return startPageNo;}
	public int getEndPageNo() {return endPageNo;}
	public boolean isPrev() {return prev;}
	public boolean isNext() {return next;}
	
	public void setDisplayContentInPage(int displayContentInPage) {this.displayContentInPage = displayContentInPage;}
	public void setDisplayPageInPage(int displayPageInPage) {this.displayPageInPage = displayPageInPage;}
	public void setCurpageNo(int curpageNo) {this.curpageNo = curpageNo;}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		makePage();
	}
	public void setStartPageNo(int startPageNo) {this.startPageNo = startPageNo;}
	public void setEndPageNo(int endPageNo) {this.endPageNo = endPageNo;}
	public void setPrev(boolean prev) {this.prev = prev;}
	public void setNext(boolean next) {this.next = next;}
	
	//갯수 변경
	public void setCriteria(int displayContentInPage, int displayPageInPage) {
		setDisplayContentInPage(displayContentInPage);
		setDisplayPageInPage(displayPageInPage);
	}
	//페이지 생성
	//(setTotalCount 실행시 실행됨)
	private void makePage() {
		int maxPage = (int)(Math.ceil((totalCount/(double)displayContentInPage)));	//페이지 블럭 전체갯수
		startPageNo = ((curpageNo-1) / displayPageInPage) * displayPageInPage + 1;
		endPageNo = startPageNo + (displayPageInPage - 1);
		if(endPageNo > maxPage) { endPageNo = maxPage;}
		
		prev = (startPageNo > 1) ? true : false;
		next = (endPageNo < maxPage) ? true : false;
	}

}

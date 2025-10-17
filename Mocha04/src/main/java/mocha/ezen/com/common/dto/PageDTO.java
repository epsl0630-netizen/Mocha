package mocha.ezen.com.common.dto;

public class PageDTO {
	private int displayContentInPage = 15;	//ȭ�鿡 ���̴� ������ ����
	private int displayPageInPage = 10;	//ȭ�鿡 ���̴� ������ ����
	
	private int curpageNo;		//���� ������ ��ȣ
	private int totalCount;		//�� �Խñ� ����
	
	private int startPageNo;	//���� ������ ��ȣ
	private int endPageNo;		//�� ������ ��ȣ
	
	private boolean prev;		//���� ��ư
	private boolean next;		//���� ��ư
	
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
	
	//���� ����
	public void setCriteria(int displayContentInPage, int displayPageInPage) {
		setDisplayContentInPage(displayContentInPage);
		setDisplayPageInPage(displayPageInPage);
	}
	//������ ����
	//(setTotalCount ����� �����)
	private void makePage() {
		int maxPage = (int)(Math.ceil((totalCount/(double)displayContentInPage)));	//������ �� ��ü����
		startPageNo = ((curpageNo-1) / displayPageInPage) * displayPageInPage + 1;
		endPageNo = startPageNo + (displayPageInPage - 1);
		if(endPageNo > maxPage) { endPageNo = maxPage;}
		
		prev = (startPageNo > 1) ? true : false;
		next = (endPageNo < maxPage) ? true : false;
	}

}

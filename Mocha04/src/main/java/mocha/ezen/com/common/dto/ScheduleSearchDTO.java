package mocha.ezen.com.common.dto;

public class ScheduleSearchDTO extends SearchDTO{
	private String start_at; 		//검색기간 시작일
	private String end_at; 			//검색기간 종료일
	private String schedule_kind;	//일정구분
	private String name;			//작성자
	private String dept_id;			//부서 id
	private String schedule_title;	//스케줄 제목
	public String getStart_at() {
		return start_at;
	}
	public String getEnd_at() {
		return end_at;
	}
	public String getSchedule_kind() {
		return schedule_kind;
	}
	public String getName() {
		return name;
	}
	public String getDept_id() {
		return dept_id;
	}
	public void setStart_at(String start_at) {
		//start_at = start_at + " 00:00:00";
		this.start_at = start_at;
	}
	public void setEnd_at(String end_at) {
		this.end_at = end_at;
	}
	public void setSchedule_kind(String schedule_kind) {
		this.schedule_kind = schedule_kind;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getSchedule_title() {
		return schedule_title;
	}
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	
	
	
	
	
}

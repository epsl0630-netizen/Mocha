package mocha.ezen.com.position;

public class PositionDTO {
	private String position_no;	   // ���޹�ȣ
	private String position_name;  // ���޸�
	private String position_level; // ���޷���
	
	public String getPosition_no()    { return position_no;    }
	public String getPosition_name()  { return position_name;  }
	public String getPosition_level() { return position_level; }
	
	public void setPosition_no(String position_no)       { this.position_no = position_no;  	 }
	public void setPosition_name(String position_name)   { this.position_name = position_name;   }
	public void setPosition_level(String position_level) { this.position_level = position_level; }
	
	
}

package mocha.ezen.com.alarm;

public class AlarmDTO {

		private String alarm_mo;	// �˸���ȣ
		private String alarm_kind;  // �˸�����
		private String is_read;     // ��������
		private String sent_at;  	// �߼��Ͻ�
		private String alarm_note;  // �˸�����
		private String receiver_id; // �޴� ��� ��ȣ
		private String send_id;     // ���������ȣ 
		
		
		public String getAlarm_mo()    { return alarm_mo;    } 
		public String getAlarm_kind()  { return alarm_kind;  }
		public String getIs_read() 	   { return is_read;     }
		public String getSent_at()     { return sent_at;     }
		public String getAlarm_note()  { return alarm_note;  }
		public String getReceiver_id() { return receiver_id; }
		public String getSend_id()	   { return send_id;     }
			
		public void setAlarm_mo(String alarm_mo) 	   { this.alarm_mo = alarm_mo;       }
		public void setAlarm_kind(String alarm_kind)   { this.alarm_kind = alarm_kind;   }
		public void setIs_read(String is_read) 		   { this.is_read = is_read;         }
		public void setSent_at(String sent_at)		   { this.sent_at = sent_at;         }
		public void setAlarm_note(String alarm_note)   { this.alarm_note = alarm_note;   }
		public void setReceiver_id(String receiver_id) { this.receiver_id = receiver_id; }
		public void setSend_id(String send_id)		   { this.send_id = send_id;         }
		
		
		
	
	
}

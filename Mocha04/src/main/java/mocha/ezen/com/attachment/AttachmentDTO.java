package mocha.ezen.com.attachment;

public class AttachmentDTO {
	private String attach_no;	// ÷������ ��ȣ
	private String path;		// ������/Ű
	private String mime_type;	// mimeŸ��
	private String ext;			// Ȯ����
	private String file_size;	// ���� ũ��
	private String pname;		// �������ϸ�
	private String fname;		// �����ϸ�
	private String board_no;	// �Խñ� ��ȣ
	
	
	public String getAttach_no() { return attach_no; }
	public String getPath() 	 { return path;      }
	public String getMime_type() { return mime_type; }
	public String getExt() 	 	 { return ext;       }
	public String getFile_size() { return file_size; }
	public String getPname() 	 { return pname;     }
	public String getFname() 	 { return fname;     }
	public String getBoard_no()  { return board_no;  }
	
	public void setAttach_no(String attach_no) { this.attach_no = attach_no; }
	public void setPath(String path) 		   { this.path = path;           }
	public void setMime_type(String mime_type) { this.mime_type = mime_type; }
	public void setExt(String ext) 			   { this.ext = ext;             }
	public void setFile_size(String file_size) { this.file_size = file_size; }
	public void setPname(String pname) 		   { this.pname = pname;         } 
	public void setFname(String fname)         { this.fname = fname;  	     }
	public void setBoard_no(String board_no)   { this.board_no = board_no;   }
	
	
	
}

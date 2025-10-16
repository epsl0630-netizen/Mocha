package mocha.ezen.com.attachment;

public class AttachmentDTO {
	private String attach_no;	// 첨부파일 번호
	private String path;		// 저장경로/키
	private String mime_type;	// mime타입
	private String ext;			// 확장자
	private String file_size;	// 파일 크기
	private String pname;		// 물리파일명
	private String fname;		// 논리파일명
	private String board_no;	// 게시글 번호
	
	
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

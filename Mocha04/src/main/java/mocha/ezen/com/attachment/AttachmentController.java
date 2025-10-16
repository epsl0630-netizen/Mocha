package mocha.ezen.com.attachment;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mocha.ezen.com.approval.ApprovalRepository;

public class AttachmentController 
{
	private static final String uploadPath = "D:\\jhjeong\\workspace\\Mocha\\upload";
	
	//÷������ �ٿ�ε�
		@RequestMapping(value = "/Download")
		public void Download(@RequestParam(required = true) String no,
				HttpServletResponse response) throws Exception
		{
			AttachmentDTO dto = ApprovalRepository.Read(no, true);
			
			File file = new File(uploadPath, dto.getPname());
			
			// ���ϸ� ���ڵ�
			//String filename = vo.getFname();
			String filename = new String(dto.getFname().getBytes("UTF-8"),
					"ISO-8859-1");
					
			// file �ٿ�ε� ����
			response.setContentType("application/download");
			response.setContentLength((int)file.length());
			response.setHeader("Content-Disposition", "attatchment;filename=\"" + filename + "\"");
			
			// �ٿ�ε� �� ����Ǵ� �̸��� Response Header�� "Content-Disposition"�� ���
			OutputStream os = response.getOutputStream();
			
			FileInputStream fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
			
		}
}

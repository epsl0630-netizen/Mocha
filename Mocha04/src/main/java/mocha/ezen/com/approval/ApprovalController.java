package mocha.ezen.com.approval;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import mocha.ezen.com.admin.AdminRepository;
import mocha.ezen.com.approver.ApproverDTO;
import mocha.ezen.com.attachment.AttachmentDTO;
import mocha.ezen.com.schedule.ScheduleDTO;
import mocha.ezen.com.schedule.ScheduleRepository;
import mocha.ezen.com.user.UserRepository;

@Controller
@RequestMapping("/approval")
public class ApprovalController 
{
	//���ε� ��� , ���� �߰� ����
	//private static final String uploadPath = "C:\\Users\\MYCOM\\git\\repository4\\Mocha04\\upload";
	
		@Autowired
		ApprovalRepository  approvalRepository;
		@Autowired
		UserRepository userRepository;
		@Autowired
		AdminRepository adminRepository;
		
		
		@RequestMapping(value = "/approvalList",  method = RequestMethod.GET)
		public String ApprovalList(Model model, ApprovalDTO dto)
		{
			if(dto.getApproval_kind() == null) {
				dto.setApproval_kind("1");
			}
			//����¡, ���籸�� 
			List<ApprovalDTO> allEvents = approvalRepository.selectapprovalList(dto);
		    model.addAttribute("list", allEvents);
			return "approval/approvalList";
		}
		
		
		@RequestMapping(value = "/draftList",  method = RequestMethod.GET)
		public String DraftList(Model model, ApprovalDTO dto)
		{
			if(dto.getApproval_kind() == null) {
				dto.setApproval_kind("1");
			}
			//����¡
			List<ApprovalDTO> allEvents = approvalRepository.selectdraftList(dto);
		    model.addAttribute("list", allEvents);
			return "approval/draftList";
		}
	
		
		@RequestMapping(value = "/addApprovalList",  method = RequestMethod.GET)
		public String AddApprovalList()
		{
			//����¡
			
			return "approval/addApprovalList";
		}
	
		@RequestMapping(value = "/draftWrite", method = RequestMethod.GET)
		public String DraftWriteForm(Model model)
		{
		    // ����ڰ� ���� ������ �ۼ��� JSP/HTML �������� ��ȯ
		    return "approval/draftWrite"; 
		}
		
		@RequestMapping(value = "/draftWrite",  method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> DraftWrite(ApprovalDTO dto)
		{
			int result = approvalRepository.Insert(dto);
			
			Map<String, Object> response = new HashMap<String, Object>();
			if (result > 0) {
		        
		        response.put("result", "success");
		        response.put("approval_no", dto.getApproval_no()); 
		        
		    } else {
		       
		        response.put("result", "fail");
		        response.put("message", "���� ��ſ� �����߽��ϴ�.");
		    }
		    
			return response;
		}

		/*	
		@RequestMapping(value = "/draftWriteOK", method = RequestMethod.POST)
		public String DraftWriteOK(ApprovalDTO dto,
				@RequestParam("attach")MultipartFile file,
				HttpServletRequest request, AttachmentDTO adto) throws IllegalStateException, IOException
		{	
			if(file != null)
			{
				//÷������ ���ε� �Ǿ���.
				
				//���ε�� ���� ���� �̸� ��������
				String originalFileName = file.getOriginalFilename();
				System.out.println("originalFileName:" + originalFileName);
				
				//���� �̸��� �ߺ����� �ʵ��� ���� �̸� ���� : ������ ������ �̸�
				// UUID Ŭ���� ���
				UUID uuid = UUID.randomUUID();
				String savedFileName = uuid.toString();
				System.out.println("savedFileName:" + savedFileName);
				
				//÷������ ��ü ����
				java.io.File newFile = new File(uploadPath + "\\" + savedFileName);
				
				//���� ���� ���丮�� ����		
				file.transferTo(newFile);
				
				adto.setFname(originalFileName); //�������ϸ�
				adto.setPname(savedFileName);    //����� ���ϸ�
			}
			
			approvalRepository.Insert(dto);
			
			return "redirect:/approvalView?no=" + dto.getApproval_no();
		}	
		
		@RequestMapping(value = "/approvalModify")
		public String ApprovalModify(@RequestParam(required = true) String no,
				Model model)
		{
			//�Խù� ���� ��ȸ
			ApprovalDTO dto = approvalRepository.Read(no, false);

			model.addAttribute("item",dto);
			
			return "approvalmodify";
		}
	
		@RequestMapping(value = "/approvalModifyOK", method = RequestMethod.POST)
		public String ApprovalModifyOK(ApprovalDTO dto,
				@RequestParam("attach")MultipartFile file,
				HttpServletRequest request, AttachmentDTO adto) throws IllegalStateException, IOException
		{	
			if(file != null)
			{
				//÷������ ���ε� �Ǿ���.
				
				//���ε�� ���� ���� �̸� ��������
				String originalFileName = file.getOriginalFilename();
				System.out.println("originalFileName:" + originalFileName);
				
				//���� �̸��� �ߺ����� �ʵ��� ���� �̸� ���� : ������ ������ �̸�
				// UUID Ŭ���� ���
				UUID uuid = UUID.randomUUID();
				String savedFileName = uuid.toString();
				System.out.println("savedFileName:" + savedFileName);
				
				//÷������ ��ü ����
				java.io.File newFile = new File(uploadPath + "\\" + savedFileName);
				
				//���� ���� ���丮�� ����		
				file.transferTo(newFile);
				
				adto.setFname(originalFileName); //�������ϸ�
				adto.setPname(savedFileName);    //����� ���ϸ�
			}
			
			approvalRepository.Update(dto);
			
			return "redirect:/approvalView?no=" + dto.getApproval_no();
		}
		
		@RequestMapping(value = "/reDraftWrite")
		public String ReDraftWrite()
		{
			return "reDraftWrite";
		}	
		
		@RequestMapping(value = "/reDraftWriteOK", method = RequestMethod.POST)
		public String ReDraftWriteOK(ApprovalDTO dto,
				@RequestParam("attach")MultipartFile file,
				HttpServletRequest request, AttachmentDTO adto) throws IllegalStateException, IOException
		{	
			if(file != null)
			{
				//÷������ ���ε� �Ǿ���.
				
				//���ε�� ���� ���� �̸� ��������
				String originalFileName = file.getOriginalFilename();
				System.out.println("originalFileName:" + originalFileName);
				
				//���� �̸��� �ߺ����� �ʵ��� ���� �̸� ���� : ������ ������ �̸�
				// UUID Ŭ���� ���
				UUID uuid = UUID.randomUUID();
				String savedFileName = uuid.toString();
				System.out.println("savedFileName:" + savedFileName);
				
				//÷������ ��ü ����
				java.io.File newFile = new File(uploadPath + "\\" + savedFileName);
				
				//���� ���� ���丮�� ����		
				file.transferTo(newFile);
				
				adto.setFname(originalFileName); //�������ϸ�
				adto.setPname(savedFileName);    //����� ���ϸ�
			}
			
			approvalRepository.Insert(dto);
			
			return "redirect:/approvalView?no=" + dto.getApproval_no();
		}	
		
	
		@RequestMapping(value = "/approvalView", method = RequestMethod.GET)
		public String ApprovalView(@RequestParam(required = true) String no,
				Model model)
		{
			//�Խù� ���� ��ȸ
			ApprovalDTO dto = approvalRepository.Read(no);
			
			//���缱 ����� ��ȸ
			List<ApproverDTO> approver = approvalRepository.approverList(no);
			
			model.addAttribute("item",dto);
			model.addAttribute("reply",approver);
			
			return "approvalView";
		}
		
	
		@RequestMapping(value = "/approvalDelete.do")
		public String ApprovalDelete(@RequestParam(required = true)String no)
		{
			approvalRepository.Delete(no);
			return "redirect:/DraftList";
		}
		*/
			
		
	
}

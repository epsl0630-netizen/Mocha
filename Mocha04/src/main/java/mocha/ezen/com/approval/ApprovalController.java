package mocha.ezen.com.approval;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import mocha.ezen.com.departments.DepartmentDTO;
import mocha.ezen.com.schedule.ScheduleDTO;
import mocha.ezen.com.schedule.ScheduleRepository;
import mocha.ezen.com.user.UserDTO;
import mocha.ezen.com.user.UserRepository;

@Controller
@RequestMapping("/approval")
public class ApprovalController 
{
	//업로드 경로 , 추후 추가 결정
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
			//페이징, 결재구분 
			List<ApprovalDTO> allEvents = approvalRepository.selectapprovalList(dto);
		    model.addAttribute("list", allEvents);
			return "approval/approvalList";
		}
		
		
		@RequestMapping(value = "/draftList",  method = RequestMethod.GET)
		public String DraftList(Model model, ApprovalDTO dto, HttpSession session)
		{
//		    UserDTO loginUser = (UserDTO) session.getAttribute("login");
//		    
//		    if (loginUser != null) {
//		        dto.setUser_id(loginUser.getUser_id()); 
//		    } else {
//		         return "redirect:/user/login"; 
//		    }
			
			if(dto.getApproval_kind() == null) {
				dto.setApproval_kind("1");
			}
			//페이징
			List<ApprovalDTO> allEvents = approvalRepository.selectdraftList(dto);
		    model.addAttribute("list", allEvents);
			return "approval/draftList";
		}
	
		
		@RequestMapping(value = "/addApprovalList",  method = RequestMethod.GET)
		public String AddApprovalList()
		{
			//페이징
			
			return "approval/addApprovalList";
		}
		
		/*
		 * @RequestMapping(value = "/approvalList", method = RequestMethod.GET) public
		 * String ApproverList(Model model, ApproverDTO dto) {
		 * 
		 * //페이징, 결재구분 List<ApproverDTO> allEvents =
		 * approvalRepository.approverList(dto); model.addAttribute("list", allEvents);
		 * return "approval/approvalList"; }
		 */
		
	
		@RequestMapping(value = "/draftWrite", method = RequestMethod.GET)
		public String DraftWriteForm(Model model, HttpSession session)
		{
		    // 사용자가 결재 문서를 작성할 JSP/HTML 페이지를 반환	
			//select * from user;
			List<DepartmentDTO> deptWithUser = userRepository.deptWithUser();
			model.addAttribute("dept", deptWithUser);
			
			UserDTO loginUser = (UserDTO) session.getAttribute("login");
			model.addAttribute("loginUser", loginUser);
			
			if (loginUser == null) {
		        System.out.println("ERROR: loginUser is NULL in session!");
		    }
		
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
		        response.put("message", "결재 상신에 실패했습니다.");
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
				//첨부파일 업로드 되었음.
				
				//업로드된 원본 파일 이름 가져오기
				String originalFileName = file.getOriginalFilename();
				System.out.println("originalFileName:" + originalFileName);
				
				//파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
				// UUID 클래스 사용
				UUID uuid = UUID.randomUUID();
				String savedFileName = uuid.toString();
				System.out.println("savedFileName:" + savedFileName);
				
				//첨부파일 객체 생성
				java.io.File newFile = new File(uploadPath + "\\" + savedFileName);
				
				//실제 저장 디렉토리로 전송		
				file.transferTo(newFile);
				
				adto.setFname(originalFileName); //원본파일명
				adto.setPname(savedFileName);    //저장된 파일명
			}
			
			approvalRepository.Insert(dto);
			
			return "redirect:/approvalView?no=" + dto.getApproval_no();
		}	
		
		@RequestMapping(value = "/approvalModify")
		public String ApprovalModify(@RequestParam(required = true) String no,
				Model model)
		{
			//게시물 정보 조회
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
				//첨부파일 업로드 되었음.
				
				//업로드된 원본 파일 이름 가져오기
				String originalFileName = file.getOriginalFilename();
				System.out.println("originalFileName:" + originalFileName);
				
				//파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
				// UUID 클래스 사용
				UUID uuid = UUID.randomUUID();
				String savedFileName = uuid.toString();
				System.out.println("savedFileName:" + savedFileName);
				
				//첨부파일 객체 생성
				java.io.File newFile = new File(uploadPath + "\\" + savedFileName);
				
				//실제 저장 디렉토리로 전송		
				file.transferTo(newFile);
				
				adto.setFname(originalFileName); //원본파일명
				adto.setPname(savedFileName);    //저장된 파일명
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
				//첨부파일 업로드 되었음.
				
				//업로드된 원본 파일 이름 가져오기
				String originalFileName = file.getOriginalFilename();
				System.out.println("originalFileName:" + originalFileName);
				
				//파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
				// UUID 클래스 사용
				UUID uuid = UUID.randomUUID();
				String savedFileName = uuid.toString();
				System.out.println("savedFileName:" + savedFileName);
				
				//첨부파일 객체 생성
				java.io.File newFile = new File(uploadPath + "\\" + savedFileName);
				
				//실제 저장 디렉토리로 전송		
				file.transferTo(newFile);
				
				adto.setFname(originalFileName); //원본파일명
				adto.setPname(savedFileName);    //저장된 파일명
			}
			
			approvalRepository.Insert(dto);
			
			return "redirect:/approvalView?no=" + dto.getApproval_no();
		}	
		
	
		@RequestMapping(value = "/approvalView", method = RequestMethod.GET)
		public String ApprovalView(@RequestParam(required = true) String no,
				Model model)
		{
			//게시물 정보 조회
			ApprovalDTO dto = approvalRepository.Read(no);
			
			//결재선 목록을 조회
			List<ApproverDTO> approver = approvalRepository.approverList(no);
			
			model.addAttribute("item",dto);
			model.addAttribute("reply",approver);
			
			return "approval/draftView";
		}
				*/
		@RequestMapping(value = "/draftView", method = RequestMethod.GET)
		public String DraftlView(@RequestParam(required = true) String no,
				Model model,  HttpSession session)
		{
			//게시물 정보 조회
			ApprovalDTO dto = approvalRepository.Read(no);
			
			//결재선 목록을 조회
			List<ApproverDTO> approver = approvalRepository.approverviewList(no);
			UserDTO loginUser = (UserDTO) session.getAttribute("login");
			model.addAttribute("loginUser", loginUser);
			
			if (loginUser == null) {
		        System.out.println("ERROR: loginUser is NULL in session!");
		    }
		
			
			model.addAttribute("item",dto);
			model.addAttribute("reply",approver);
			
			
			return "approval/draftView";
		}
			
		@RequestMapping(value = "/approvalView", method = RequestMethod.GET)
		public String ApprovalView(@RequestParam(required = true) String no,
				Model model,  HttpSession session)
		{
			//게시물 정보 조회
			ApprovalDTO dto = approvalRepository.Read(no);
			
			//결재선 목록을 조회
			List<ApproverDTO> approver = approvalRepository.approverviewList(no);
			UserDTO loginUser = (UserDTO) session.getAttribute("login");
			
			model.addAttribute("loginUser", loginUser);
			
			if (loginUser == null) {
		        System.out.println("ERROR: loginUser is NULL in session!");
		    }
		
			
			model.addAttribute("item",dto);
			model.addAttribute("reply",approver);
			
			
			return "approval/draftView";
		}
			
		
	
		@RequestMapping(value = "/approvalDelete.do")
		public String ApprovalDelete(@RequestParam(required = true)String no)
		{
			approvalRepository.Delete(no);
			return "redirect:/DraftList";
		}
	
		
	
}

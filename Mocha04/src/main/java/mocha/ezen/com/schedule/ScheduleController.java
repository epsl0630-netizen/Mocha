package mocha.ezen.com.schedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/schedule")
public class ScheduleController 
{
	@Autowired
	ScheduleRepository  scheduleRepository;
	
	//전제목록조회
	@RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
	public String ScheduleList(Model model, ScheduleDTO dto)
	{
		//페이징
		
		List<ScheduleDTO> allEvents = scheduleRepository.selectAllEvents(dto);
	    model.addAttribute("scheduleList", allEvents);
		
		return "schedule/scheduleList";
	}
	
	
	//일정 목록 데이터 조회 API (클라이언트/Ajax용)
	@RequestMapping(value = "/ScheduleView",  method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> ScheduleView(ScheduleDTO dto) {
	    
	    List<ScheduleDTO> allSchedules = scheduleRepository.selectAllEvents(dto);
	    
	    Map<String, Object> response = new HashMap<String, Object>();
	    response.put("result", "success");   
	    response.put("scheduleList", allSchedules);
	    
	    return response;
	}
	
	//일정 단일 조회 (ajax 모달 상세보기용)
	@RequestMapping(value = "/ScheduleOne", method = RequestMethod.GET )
    @ResponseBody
    public ScheduleDTO ScheduleOne(@RequestParam("no") String scheduleNo) {
       
        return scheduleRepository.Read(scheduleNo); 
    }
	
	
	@RequestMapping(value = "/ScheduleWrite", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> ScheduleWrite(ScheduleDTO dto)
	{
		scheduleRepository.Insert(dto);
		
		Map<String, Object> response = new HashMap<String, Object>();
	    response.put("result", "success");
	    response.put("no", dto.getSchedule_no());
	    
		return response;
	}
	
 
	@RequestMapping(value = "/ScheduleModify", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> ScheduleModify(@RequestParam(required = true) String no,
			ScheduleDTO dto)
	{
		scheduleRepository.Update(dto);
		
		Map<String, Object> response = new HashMap<String, Object>();
	    response.put("result", "success");
	    response.put("no", dto.getSchedule_no());
		
		return response;
	}
	

	@RequestMapping(value = "/ScheduleDelete", method = RequestMethod.POST)
	@ResponseBody
	public  Map<String, Object> ScheduleDelete(@RequestParam(required = true)String no)
	{
		scheduleRepository.Delete(no);
		Map<String, Object> response = new HashMap<String, Object>();
	    response.put("result", "success"); 
	    response.put("deletedNo", no);
	    
		return response;
	}
	
	@RequestMapping(value = "/AddminScheduleList")
	public String AddminScheduleList()
	{
		//페이징
		
		return "schedule/AddminScheduleList";
	}
	
}
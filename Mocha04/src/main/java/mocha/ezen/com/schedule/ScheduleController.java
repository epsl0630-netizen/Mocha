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
	
	@RequestMapping(value = "/scheduleList", method = RequestMethod.GET)
	public String ScheduleList(Model model)
	{
		//∆‰¿Ã¬°
		
		
		return "schedule/scheduleList";
	}
	
	@RequestMapping(value = "/eventsData", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduleDTO> getEventsData() {
	   
	    List<ScheduleDTO> allEvents = scheduleRepository.selectAllEvents(null); 
	    
	 
	    return allEvents;
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
	
	
	@RequestMapping(value = "/ScheduleWriteOK", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> ScheduleWriteOK(ScheduleDTO dto)
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
		scheduleRepository.Insert(dto);
		
		Map<String, Object> response = new HashMap<String, Object>();
	    response.put("result", "success");
	    response.put("no", dto.getSchedule_no());
		
		return response;
	}
	
	@RequestMapping(value = "/ScheduleModifyOK", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, Object> ScheduleModifyOK(ScheduleDTO dto)
	{
		scheduleRepository.Update(dto);
		
		Map<String, Object> response = new HashMap<String, Object>();
	    response.put("result", "success");
	    response.put("no", dto.getSchedule_no());
	    
		return response;
	}
	
	@RequestMapping(value = "/ScheduleList")
	@ResponseBody 
	public Map<String, Object> ScheduleView(ScheduleDTO dto) {
	    
	    scheduleRepository.Insert(dto);

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
		//∆‰¿Ã¬°
		
		return "schedule/AddminScheduleList";
	}
	
}
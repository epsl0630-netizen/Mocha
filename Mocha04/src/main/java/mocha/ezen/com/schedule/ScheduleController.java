package mocha.ezen.com.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@RequestMapping("/scheduleList")
	public String ScheduleList()
	{
		return "schedule/scheduleList";
	}
}
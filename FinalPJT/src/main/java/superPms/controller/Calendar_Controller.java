package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Calendar_Service;
import superPms.vo.Calendar;

@Controller
public class Calendar_Controller {

	@Autowired
	private Calendar_Service service; 
	
//	http://localhost:7080/FinalPJT/calList.do
	@GetMapping("/calList.do")
	public String calList() {
		return "WEB-INF\\suminView\\calendar.jsp";
	}
	
//	http://localhost:7080/FinalPJT/calListAjax.do
	@RequestMapping("/calListAjax.do")
	public String calListAjax(Model d) {
		d.addAttribute("calList", service.calList());
		return "pageJsonReport";
	}
	
	@RequestMapping("/insertCalendar.do")
	public String insCalendar(Calendar ins,Model d) {
		service.insCalendar(ins);
		d.addAttribute("msg", "일정 등록 완료");
		return "pageJsonReport";
	}
	@RequestMapping("/updateCalendar.do")
	public String uptCalendar(Calendar upt,Model d) {
		service.uptCalendar(upt);
		d.addAttribute("msg", "일정 수정 완료");
		return "pageJsonReport";
	}
	@RequestMapping("/deleteCalendar.do")
	public String delCalendar(@RequestParam("id")int id,Model d) {
		service.delCalendar(id);
		d.addAttribute("msg", "일정 삭제 완료");
		return "pageJsonReport";
	}
}

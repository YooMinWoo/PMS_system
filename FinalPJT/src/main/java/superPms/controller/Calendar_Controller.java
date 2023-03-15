package superPms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Calendar_Service;
import superPms.vo.Calendar;
import superPms.vo.SuperEmpDept;

@Controller
public class Calendar_Controller {

	@Autowired
	private Calendar_Service service; 
	// http://localhost:7080/FinalPJT/PMSLogin.do
	//	http://localhost:7080/FinalPJT/calList.do
	@GetMapping("/calList.do")
	public String calList(Model d, HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", service.alertList(sObj.getId()));
		d.addAttribute("alertCount", service.alertCount(sObj.getId()));
		return "WEB-INF\\suminView\\calendar.jsp";
	}
	
	//	http://localhost:7080/FinalPJT/calListAjax.do
	@RequestMapping("/calListAjax.do")
	public String calListAjax(HttpSession session,Model d) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("calList", service.calList(sObj.getId()));
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

	@RequestMapping("/alertState01.do")
	public String alertState(@RequestParam("no")int no) {
		service.alertState(no);
		return "WEB-INF\\suminView\\calendar.jsp";
	}
	
	@RequestMapping("/getProSch.do")
	public String getProSch(HttpSession session,Model d) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("getProSch", service.getProSch(sObj.getId()));
		return "WEB-INF\\suminView\\getProSch.jsp";
	}
	
	@RequestMapping("/insCalPro.do")
	public String insCalPro(Calendar ins,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		ins.setWriter(sObj.getId());
		service.insCalPro(ins);
		d.addAttribute("msg", "프로젝트 일정이 추가되었습니다.");
		return "WEB-INF\\suminView\\getProSch.jsp";
	}
}

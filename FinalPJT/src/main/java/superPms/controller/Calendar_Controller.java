package superPms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Alert_Service;
import superPms.service.Calendar_Service;
import superPms.vo.Calendar;
import superPms.vo.SuperEmpDept;

@Controller
public class Calendar_Controller {

	@Autowired
	private Calendar_Service service; 
	
	@Autowired
	private Alert_Service alert_service;
	
	// http://localhost:7080/FinalPJT/PMSLogin.do
	//	http://localhost:7080/FinalPJT/calList.do
	@GetMapping("/calList.do")
	public String calList(Model d, HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		return "WEB-INF\\suminView\\calendar.jsp";
	}
	
	@RequestMapping("/calListAjax.do")
	public String calListAjax(HttpSession session,Model d) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("calList", service.calList(sObj.getId()));
		return "pageJsonReport";
	}
	
	@RequestMapping("/insertCalendar.do")
	public String insCalendar(Calendar ins,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		service.insCalendar(ins);
		d.addAttribute("msg", "일정 등록 완료");
		return "pageJsonReport";
	}
	@RequestMapping("/updateCalendar.do")
	public String uptCalendar(Calendar upt,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		service.uptCalendar(upt);
		d.addAttribute("msg", "일정 수정 완료");
		return "pageJsonReport";
	}
	@RequestMapping("/deleteCalendar.do")
	public String delCalendar(@RequestParam("id")int id,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		service.delCalendar(id);
		d.addAttribute("msg", "일정 삭제 완료");
		return "pageJsonReport";
	}

	
	
	@RequestMapping("/getProSch.do")
	public String getProSch(HttpSession session,Model d) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("getProSch", service.getProSch(sObj.getId()));
		d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		return "WEB-INF\\suminView\\getProSch.jsp";
	}
	
	@RequestMapping("/insCalPro.do")
	public String insCalPro(Calendar ins,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		ins.setWriter(sObj.getId());
		List<Calendar> list = service.getTitle(ins.getWriter());
		
		boolean isChecked = false;
		for(Calendar data : list) {
			if(ins.getTitle().equals(data.getTitle())) {
				isChecked = true;
			}
		}
		if(!isChecked) {
			service.insCalPro(ins);
			d.addAttribute("msg", "프로젝트 일정이 추가되었습니다.");
		}else {
			d.addAttribute("msg", "이미 추가된 프로젝트입니다.");
		}
		d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		return "WEB-INF\\suminView\\getProSch.jsp";
	}
}

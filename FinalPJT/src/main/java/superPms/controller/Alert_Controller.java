package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Alert_Service;

@Controller
public class Alert_Controller {

	@Autowired
	private Alert_Service service;
	// http://localhost:7080/FinalPJT/alert.do
	@GetMapping("/alert.do")
	public String alertList(Model d) {
		String id="monsta@gmail.com";
		d.addAttribute("alertList", service.alertList(id));
		d.addAttribute("alertCount", service.alertCount(id));
		return "WEB-INF\\suminView\\alert.jsp";
	}
	
	@RequestMapping("/alertState.do")
	public String alertState(@RequestParam("no")int no) {
		service.alertState(no);
		return "WEB-INF\\\\suminView\\\\alert.jsp";
	}
//	@RequestMapping("/alertList.do")
//	public String alertAjax(@RequestParam("id")String id,Model d) {
//		d.addAttribute("alertList", service.alertList(id));
//		return "WEB-INF\\\\suminView\\\\alert.jsp";
//	}
	
}

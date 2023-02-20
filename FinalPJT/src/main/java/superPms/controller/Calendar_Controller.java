package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import superPms.service.Calendar_Service;

@Controller
public class Calendar_Controller {

	@Autowired
	private Calendar_Service service;
	
//	http://localhost:7080/FinalPJT/calList.do
	@GetMapping("/calList.do")
	public String calList() {
		return "WEB-INF\\suminView\\calendar.jsp";
	}
}

package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.Work_Service;

@Controller
public class Work_Controller {
	@Autowired(required=false)
	private Work_Service service; 
	
	// http://localhost:7080/FinalPJT/worklist.do
	@RequestMapping("/worklist.do")
	public String worklist(Model d) {
		d.addAttribute("worklist",service.getworkList());
		return "WEB-INF\\jongeunView\\workList.jsp";
	}
}

package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.Drive_Service;
import superPms.vo.Drive;

@Controller
public class Drive_Controller {
	@Autowired
	private Drive_Service service;
	
//	http://localhost:2030/FinalPJT/goDrive.do
	@RequestMapping("/goDrive.do")
	public String goDrive(Drive sch, Model d) {
		d.addAttribute("driveList",service.driveList(sch));
		return "WEB-INF\\minwooView\\drive.jsp";
	}
}

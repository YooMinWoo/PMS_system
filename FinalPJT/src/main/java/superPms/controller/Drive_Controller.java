package superPms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Drive_Controller {
	
//	http://localhost:2030/FinalPJT/goDrive.do
	@RequestMapping("/goDrive.do")
	public String goDrive() {
		return "WEB-INF\\ymwView\\drive.jsp";
	}
}

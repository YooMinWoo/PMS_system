package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Risk_Service;
import superPms.vo.Risk;


@Controller
public class Risk_Controller {
	@Autowired(required=false)
	private Risk_Service service;
	
	// http://localhost:7080/FinalPJT/project_riskList.do
	@RequestMapping("/project_riskList.do")
	public String riskList(
			@ModelAttribute("sch") Risk sch, Model d) {
		d.addAttribute("list", service.riskList(sch));
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}

	@RequestMapping("/risk.do")
	public String risk() {
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}

	@GetMapping("/project_riskDetail.do")		// 템플릿 상세페이지
	public String getRisk(@RequestParam("riskno")
	int riskno, Model d) {
		service.getRisk(riskno);
		d.addAttribute("risk",service.getRisk(riskno));
		return "WEB-INF\\jungwooView\\project_riskDetail.jsp";
	}
}

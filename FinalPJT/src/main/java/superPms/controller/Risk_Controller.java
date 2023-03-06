package superPms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import superPms.service.Risk_Service;
import superPms.vo.Risk;
import superPms.vo.RiskSch;


@Controller
public class Risk_Controller {
	@Autowired(required=false)
	private Risk_Service service;
	
	// http://localhost:7080/FinalPJT/project_riskList.do
	// http://49.238.187.241:7080/FinalPJT/project_riskList.do
	@RequestMapping("/project_riskList.do")
	public String riskList(
			@ModelAttribute("sch") Risk sch, Model d) {
		d.addAttribute("list", service.riskList(sch));
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}
	// public List<Risk> pagingRisk(RiskSch sch);
	@RequestMapping("/project_pagingRisk.do")
	public String pagingRisk(@ModelAttribute("sch") RiskSch sch, Model d) {
		d.addAttribute("list", service.pagingRisk(sch));
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}

	@RequestMapping("/risk.do")
	public String risk() {
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}

	@GetMapping("/project_riskDetail.do")		// 리스크 상세페이지
	public String getRisk(@RequestParam("riskno")
	int riskno, Model d) {
		service.getRisk(riskno);
		d.addAttribute("risk",service.getRisk(riskno));
		return "WEB-INF\\jungwooView\\project_riskDetail.jsp";
	}
	@RequestMapping("/project_riskForm.do")		// 리스크 등록폼 페이지
	public String insertForm(){
		return "WEB-INF\\jungwooView\\project_riskForm.jsp";
	}
	@PostMapping("/project_insertRisk.do")		// 리스크 등록
	public String insertRisk(Risk ins, Model d){
		service.insertRisk(ins);
		return "redirect:project_pagingRisk.do";
	}	
	
	@PostMapping("/project_riskUpdate.do")		// 리스크 수정
	public String riskUpdate(Risk upt, Model d) {
		service.updateRisk(upt);
		d.addAttribute("risk",service.getRisk(upt.getRiskno()));
		return "redirect:project_pagingRisk.do";
	}
}

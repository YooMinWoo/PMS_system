package superPms.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.servlet.LocaleResolver;

import superPms.service.Project_Service;
import superPms.service.Risk_Service;
import superPms.service.Solution_Service;
import superPms.vo.NoticeRep;
import superPms.vo.Risk;
import superPms.vo.RiskSch;
import superPms.vo.Solution;
import superPms.vo.SolutionSch;
import superPms.vo.Strategy;
import superPms.vo.Strategycare;
import superPms.vo.StrategycareSch;


@Controller
public class Risk_Controller {
	@Autowired(required=false)
	private Risk_Service service;
	@Autowired(required=false)
	private LocaleResolver localeResolver;
	@Autowired(required=false)
	private Solution_Service service2;
	@Autowired(required = false)
	private Project_Service service3;
	
	// http://localhost:7080/FinalPJT/project_riskList.do
	// http://49.238.187.241:7080/FinalPJT/project_riskList.do
	@RequestMapping("/project_riskList.do")
	public String riskList(
			@ModelAttribute("sch") Risk sch, Model d) {
		d.addAttribute("list", service.riskList(sch));
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}
	// 페이징처리
	@RequestMapping("/project_pagingRisk.do")
	public String pagingRisk(@ModelAttribute("sch2") RiskSch sch2,
			@RequestParam(value="prjno", required = false) Integer prjno ,Model d) {
		d.addAttribute("projectInfo",service3.projectInfo(prjno)); 
		d.addAttribute("list", service.pagingRisk(sch2));
		
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}

	@RequestMapping("/risk.do")
	public String risk() {
		return "WEB-INF\\jungwooView\\project_risk.jsp";
	}

	@RequestMapping("/project_riskDetail.do")		// 리스크 상세페이지
	public String getRisk(@RequestParam("riskno")
	int riskno,@ModelAttribute("sch2")SolutionSch sch2, Solution ins, Model d
	,@RequestParam("prjno")int prjno) {
		d.addAttribute("projectInfo",service3.projectInfo(prjno));
		service.getRisk(riskno);
		service2.pagingSol(sch2);	// 대처방안 페이징처리
		service.getStrategy(riskno);
		
		d.addAttribute("risk",service.getRisk(riskno));
		d.addAttribute("sol",service2.pagingSol(sch2));
		d.addAttribute("strategy",service.getStrategy(riskno));
		return "WEB-INF\\jungwooView\\project_riskDetail.jsp";
	}
	@RequestMapping("/project_riskForm.do")		// 리스크 등록폼 페이지
	public String insertForm(@RequestParam(value="lang", defaultValue = "ko")String lang,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam("prjno")Integer prjno){
		System.out.println("선택한 언어: "+lang);
		localeResolver.setLocale(request, response, new Locale(lang));
		return "WEB-INF\\jungwooView\\project_riskForm.jsp";
	}
	@RequestMapping("/project_insertRisk.do")		// 리스크 등록
	public String insertRisk(Risk ins, @RequestParam("prjno")int prjno, Model d){	
		service.insertRisk(ins);
		return "redirect:project_pagingRisk.do?prjno="+ins.getPrjno();
	}	
	
	@PostMapping("/project_riskUpdate.do")		// 리스크 수정
	public String riskUpdate(Risk upt, Model d) {
		service.updateRisk(upt);

		return "redirect:project_pagingRisk.do?prjno="+upt.getPrjno();
	}
	@PostMapping("/project_riskDelete.do")		// 리스크 삭제
	public String deleteRisk(Risk del, Model d){
		service.deleteRisk(del);
		return "redirect:project_pagingRisk.do?prjno="+del.getPrjno();
	}
	@PostMapping("/insertSol.do")				// 방안 등록
	public String insertSol(Solution ins, @RequestParam("prjno")int prjno) {
		service2.insertSol(ins);
		return "redirect://project_riskDetail.do?riskno="+ins.getRiskno()+"&prjno="+prjno;
	}
	@RequestMapping("/strategyForm.do")		// 대응전략 등록폼 페이지
	public String insertStgForm(Model d,@RequestParam("prjno")int prjno){
		d.addAttribute("projectInfo",service3.projectInfo(prjno));
		return "WEB-INF\\jungwooView\\strategyForm.jsp";
	}
	@RequestMapping("/insertStrategy.do")		// 대응전략 등록
	public String insertStrategy(Strategy ins,Risk upt,
			@RequestParam(value="prjno", required = false) Integer prjno){
		if (ins.getRisk_strategy()!="") {
			service.insertStrategy(ins);
			service.updateRisk2(upt);
		}else {
			service.insertStrategy(ins);
		}
		return "redirect://project_riskDetail.do?riskno="
		+ins.getRiskno()+"&prjno="+prjno;
	}
	@RequestMapping("/pagingCare.do")
	public String pagingCare(@ModelAttribute("sch") StrategycareSch sch, Model d
			,@RequestParam("riskno")int riskno, @RequestParam("prjno")int prjno) {
		service.getStrategy(riskno);
		d.addAttribute("care", service.pagingCare(sch));
		d.addAttribute("strategy",service.getStrategy(riskno));
		
		return "WEB-INF\\jungwooView\\strategyDetail.jsp";
	}
	@PostMapping("/insertCare.do")				// 대응전략 후처리 등록
	public String insertCare(Strategycare ins,
			@RequestParam("prjno")int prjno,
			@RequestParam("riskno")int riskno,
			@RequestParam("strategyno")int strategyno) {
		service.insertCare(ins);
		return "redirect://pagingCare.do?riskno="+riskno+"&prjno="+prjno+"&strategyno="+strategyno;
	}
}

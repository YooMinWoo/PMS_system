package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Project_Service;
import superPms.vo.Project;

@Controller
public class Project_Controller {
	@Autowired(required = false)
	private Project_Service service;
	
	
	// 전체 프로젝트 중 공개상태인 것 검색
	@RequestMapping("/allProject.do")
	public String allProject(@RequestParam(value="keyword",defaultValue = "")String keyword,Model d) {
		d.addAttribute("list",service.allProject(keyword));
		return "WEB-INF\\wonjuView\\allproject.jsp";
	}
	
	@GetMapping("/newProjectShow.do")
	public String newProjectShow() {
		return "WEB-INF\\wonjuView\\newproject.jsp";
	}
	
	@RequestMapping("/newProject.do")
	public String newProject(Project ins,Model d) {
		service.insProject(ins);
		d.addAttribute("msg","등록성공");
		d.addAttribute("prjno",ins.getPrjno());
		
		return "pageJsonReport";
	}
}

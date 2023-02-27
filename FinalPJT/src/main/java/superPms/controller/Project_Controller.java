package superPms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Project_Service;
import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.SuperDept;

@Controller
public class Project_Controller {
	@Autowired(required = false)
	private Project_Service service;
	
	@ModelAttribute("deptCom")
	public List<SuperDept> deptCom(){
		return service.deptCom();
	}
	
	// 전체 프로젝트 중 공개상태인 것 검색
	@RequestMapping("/allProject.do")
	public String allProject(@RequestParam(value="keyword",defaultValue = "")String keyword,
							@RequestParam(value="isCon",defaultValue = "Y")String isCon,Model d) {
		System.out.println(keyword);
		System.out.println(isCon);
		d.addAttribute("list",service.allProject(keyword,isCon));
		return "WEB-INF\\wonjuView\\allproject.jsp";
	}
	
	@GetMapping("/newProjectShow.do")
	public String newProjectShow() {
		return "WEB-INF\\wonjuView\\newproject.jsp";
	}
	
	@RequestMapping("/newProject.do")
	public String newProject(Project ins,ProjectMember ins2,Model d) {
		System.out.println(ins2.getOwners());
		System.out.println(ins2.getParts());
		System.out.println("###"+ins2.getOwners()[0]);
		System.out.println("###"+ins2.getOwners()[1]);
		System.out.println(ins.getDeadline());
		System.out.println(ins.getRegdte());
		System.out.println(ins.getDeptid());
		System.out.println(ins.getOpenStatus());
		System.out.println(ins.getTlid());
		service.insProject(ins,ins2);
		d.addAttribute("msg","등록성공");
		return "pageJsonReport";
	}
	
	
	@GetMapping("/projectMain.do")
	public String projectMain() {
		return "WEB-INF\\wonjuView\\project_main.jsp";
	}
}

package superPms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Gantt_Service;
import superPms.service.Project_Service;
import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.SuperDept;

@Controller
public class Project_Controller {
	@Autowired(required = false)
	private Project_Service service;
	@Autowired(required = false)
	private Gantt_Service ganttService;
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
	// 나의 프로젝트 검색
	@RequestMapping("/myProject.do")
	public String myProject(@RequestParam(value="keyword",defaultValue = "")String keyword,
			@RequestParam(value="isCon",defaultValue = "Y")String isCon,Model d) {
		System.out.println(keyword);
		System.out.println(isCon);
		String owner = "emp2@gmail.com"; //세션에 있는 로그인한 아이디를 owner에 넣기
		System.out.println(owner);
		d.addAttribute("list",service.myProject(keyword,isCon,owner));
		return "WEB-INF\\wonjuView\\myproject.jsp";
	}
	// 프로젝트 등록 화면
	@GetMapping("/newProjectShow.do")
	public String newProjectShow() {
		return "WEB-INF\\wonjuView\\newproject.jsp";
	}
	// 프로젝트 등록 프로세스
	@RequestMapping("/newProject.do")
	public String newProject(Project ins,ProjectMember ins2,Model d) {
		System.out.println(ins2.getOwners());
		System.out.println(ins2.getParts());
		System.out.println("###"+ins2.getOwners()[0]);

		//service.insProject(ins,ins2);
		d.addAttribute("msg","등록성공");
		d.addAttribute("prjno",service.insProject(ins, ins2));
		return "pageJsonReport";
	}
	
	// 프로젝트 메인화면
	@GetMapping("/projectMain.do")
	public String projectMain(@RequestParam("prjno") int prjno,Model d) {
		d.addAttribute("projectInfo",service.projectInfo(prjno));
		d.addAttribute("ganttInfo",ganttService.showGantt(prjno));
		return "WEB-INF\\wonjuView\\project_main.jsp";
	}
}

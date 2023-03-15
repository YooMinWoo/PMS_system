package superPms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Chart_Service;
import superPms.service.Gantt_Service;
import superPms.service.Project_Service;
import superPms.vo.Gantt;
import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.ProjectSch;
import superPms.vo.SuperDept;
import superPms.vo.SuperEmpDept;
import superPms.vo.SuperEmpDeptSch;

@Controller
public class Project_Controller {
	@Autowired(required = false)
	private Project_Service service;
	@Autowired(required = false)
	private Gantt_Service ganttService;
	@Autowired(required = false)
	private Chart_Service chartService;	
	@ModelAttribute("deptCom")
	public List<SuperDept> deptCom(){
		return service.deptCom();
	}
	// 전체 프로젝트 검색
	@RequestMapping("/allProject.do")
	public String allProject(@ModelAttribute("sch") ProjectSch sch,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		System.out.println(sch.getKeyword());
		System.out.println(sch.getIsCon());
		sch.setAuth(sObj.getAuth());
		d.addAttribute("list",service.allProject(sch));
		return "WEB-INF\\wonjuView\\allproject.jsp";
	}
	// 나의 프로젝트 검색
	@RequestMapping("/myProject.do")
	public String myProject(@ModelAttribute("sch") ProjectSch sch,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		sch.setOwner(sObj.getId()); //세션에 있는 로그인한 아이디를 owner에 넣기
		d.addAttribute("list",service.myProject(sch));
		return "WEB-INF\\wonjuView\\myproject.jsp";
	}
	// 사원 검색 
	@RequestMapping("/empInfoList.do")
	public String empInfoList(@ModelAttribute("sch")SuperEmpDeptSch sch, Model d) {
		d.addAttribute("empList",service.empInfoList(sch));
		return "pageJsonReport";
	}
	// 프로젝트 등록 화면
	@GetMapping("/newProjectShow.do")
	public String newProjectShow(HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		return "WEB-INF\\wonjuView\\newproject.jsp";
	}
	// 프로젝트 등록 프로세스
	@RequestMapping("/newProject.do")
	public String newProject(Project ins,ProjectMember ins2,Model d) {
		System.out.println(ins2.getOwners());
		System.out.println(ins2.getParts());
		System.out.println("###"+ins2.getOwners()[0]);
		d.addAttribute("msg","등록성공");
		d.addAttribute("prjno",service.insProject(ins, ins2));
		return "pageJsonReport";
	}
	
	// 프로젝트 메인화면
	@GetMapping("/projectMain.do")
	public String projectMain(@RequestParam("prjno") int prjno,Gantt g,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",ganttService.showGantt(g));
		d.addAttribute("memList",service.memberList(prjno));
		return "WEB-INF\\wonjuView\\project_main.jsp";
	}
	// 프로젝트 PM + 멤버정보
	@RequestMapping("/memList.do")
	public String memList(@RequestParam("prjno") int prjno,Model d) {
		d.addAttribute("memList",service.memberList(prjno));
		return "pageJsonReport";
	}
	
	// 프로젝트 멤버 추가
	@PostMapping("/inviteProMem.do")
	public String inviteProMem(ProjectMember ins,Model d) {
		System.out.println(ins.getPrjno());
		service.inviteProMem(ins);
		d.addAttribute("msg","등록성공");
		return "pageJsonReport";
	}
	// 프로젝트 수정화면 초기호출
	@GetMapping("/uptProject.do")
	public String uptProject(@RequestParam("prjno") int prjno,Model d) {
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttDate",ganttService.getMinMaxDate(prjno));
		return "WEB-INF\\wonjuView\\uptproject.jsp";
	}
	// 프로젝트 수정 프로세스
	@PostMapping("/uptProInfo.do")
	public String uptProInfo(Project upt,Model d) {
		service.uptProInfo(upt);
		d.addAttribute("msg","수정완료");
		return "pageJsonReport";
	}
	// 프로젝트 삭제 프로세스
	@PostMapping("/delProject.do")
	public String delProject(@RequestParam("prjno") int prjno,Model d) {
		service.delProject(prjno);
		d.addAttribute("msg","삭제완료");
		return "pageJsonReport";
	}
	// 프로젝트 나가기 프로세스
	@PostMapping("/delProjectMember.do")
	public String delProjectMember(ProjectMember del, Model d) {
		service.delProjectMember(del);
		d.addAttribute("msg","나가기성공");
		return "pageJsonReport";
	}
	
	// 간트차트 상세페이지 초기호출
	@GetMapping("/ganttDetailPage.do")
	public String ganttDetailPage(Gantt det,Model d) {
		System.out.println(det.getPrjno());
		System.out.println(det.getId());
		d.addAttribute("projectInfo",service.projectInfo(det.getPrjno())); 
		d.addAttribute("ganttDetail",ganttService.ganttDetail(det));
		return "WEB-INF\\wonjuView\\ganttDetail.jsp";
	}
}

package superPms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Project_Service;
import superPms.service.Work_Service;
import superPms.vo.Gantt;
import superPms.vo.GanttSch;
import superPms.vo.SuperEmpDept;
import superPms.vo.Work;
import superPms.vo.WorkRep;
import superPms.vo.WorkSch;

@Controller
public class Work_Controller {
	@Autowired(required=false)
	private Work_Service service;
	// http://49.238.187.241:7080/FinalPJT/projectSample.jsp
	// http://49.238.187.241:7080/FinalPJT/worklist.do
	// http://localhost:7080/FinalPJT/worklist.do
	/*
	@GetMapping("/worklist.do")
	public String worklist(Model d) {
		d.addAttribute("worklist",service.getWorkList());
		return "WEB-INF\\jongeunView\\workList.jsp";
	}
	@PostMapping("/workSch.do")
	public String workSch(@ModelAttribute("sch") WorkSch sch, Model d) {
		d.addAttribute("worklist",service.schWork(sch));
		if(service.schWork(sch).size()==0) {
			d.addAttribute("msg","검색된 결과가 없습니다.");
		}
		return "WEB-INF\\jongeunView\\workList.jsp";
	}
	*/
	// http://localhost:7080/FinalPJT/workList.do
	@RequestMapping("/workList.do")
	public String workList(@ModelAttribute("sch") WorkSch sch, Model d) {
		d.addAttribute("worklist",service.schWork(sch));
		return "WEB-INF\\jongeunView\\workList.jsp";
	}
	// http://localhost:7080/FinalPJT/workInsFrm.do
	@RequestMapping("/workInsFrm.do")
	public String workInsFrm() {
		return "WEB-INF\\jongeunView\\workIns.jsp";
	}
	@PostMapping("/workIns.do")
	public String workIns(Work ins, Model d) {
		service.insWork(ins);
		//d.addAttribute("msg","등록완료");
		//return "WEB-INF\\jongeunView\\workIns.jsp";
		return "WEB-INF\\jongeunView\\workIns.jsp";
	}
	// http://localhost:7080/FinalPJT/workDetail.do?no=1
	@GetMapping("/workDetail.do")
	public String workDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("work",service.getWork(no));
		return "WEB-INF\\jongeunView\\workDetail.jsp";
	}
	@PostMapping("/workUpt.do")
	public String workUpt(@RequestParam("no") int no,Work upt, Model d) {
		service.uptWork(upt);
		d.addAttribute("work",service.getWork(no));
		d.addAttribute("msg","수정완료");
		return "WEB-INF\\jongeunView\\workUpt.jsp";
	}
	@GetMapping("/workDel.do")
	public String workDel(@RequestParam("no") int no, Model d) {
		service.delWork(no);
		d.addAttribute("msg","삭제완료");
		return "WEB-INF\\jongeunView\\workDetail.jsp";
	}
	@GetMapping("/workFileDownload.do")
	public String workFileDownload(@RequestParam("fname") String fname, Model d) {
		d.addAttribute("downloadFile", fname);
		return "downloadViewer";
	}
	// gantt 연동
	// http://localhost:7080/FinalPJT/PMSLogin.do
	// http://49.238.187.241:7080/FinalPJT/PMSLogin.do
	// monsta@gmail.com
	// monbebe001
	// t711txt@gmail.com
	// 12345
	// http://localhost:7080/FinalPJT/workGanttList.do?prjno=41
	@RequestMapping("/workGanttList.do")
	public String workGanttList(@RequestParam("prjno") int prjno, @ModelAttribute("sch") GanttSch sch, Model d) {
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",service.showGantt(sch));
		return "WEB-INF\\jongeunView\\workGanttList.jsp";
	}
	@GetMapping("/workGanttDetail.do")
	public String workGanttDetail(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("projectInfo",service.projectInfo(service.ganttDetailExp(no).getPrjno()));
		d.addAttribute("personInfo",service.personInfo(no));
		d.addAttribute("ganttDetail",service.ganttDetailExp(no));
		d.addAttribute("sessmem",mem);
		if(service.ganttDetailExp(no).getParent()!=null) {
			d.addAttribute("parent",service.ganttDetailExp(service.ganttDetailExp(no).getParent()));
		}
		if(service.getWorkRepList(no).size()>0) {
			d.addAttribute("workrep",service.getWorkRepList(no));
		}
		System.out.println(mem.getId());
		System.out.println(service.projectInfo(service.ganttDetailExp(no).getPrjno()).getTlid());
		return "WEB-INF\\jongeunView\\workGanttDetail.jsp";
	}
	// 답글
	@PostMapping("/workRepIns.do")
	public String workRepIns(WorkRep ins, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		service.insWorkRep(ins);
		return "redirect:/workGanttDetail.do?no="+ins.getWorkno();
	}
	@GetMapping("/workRepDel.do")
	public String workRepDel(@RequestParam("no") int no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		service.delWorkRep(no);
		d.addAttribute("msg","삭제완료");
		return "redirect:/workGanttDetail.do";
	}
	// 결재
	@GetMapping("/reqApprove.do")
	public String reqApprove(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		service.reqApprove(no);
		d.addAttribute("msg","결재요청");
		return "redirect:/workGanttDetail.do?no="+no;
	}
	@GetMapping("/rejApprove.do")
	public String rejApprove(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		service.rejApprove(no);
		d.addAttribute("msg","결재반려");
		return "redirect:/workGanttDetail.do?no="+no;
	}
	@GetMapping("/approve.do")
	public String approve(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		service.approve(no);
		d.addAttribute("msg","결재승인");
		return "redirect:/workGanttDetail.do?no="+no;
	}
	// 결재함
	// http://localhost:7080/FinalPJT/apprvList.do?prjno=41
	@RequestMapping("/apprvList.do")
	public String apprvList(@RequestParam("prjno") int prjno, @ModelAttribute("sch") GanttSch sch, Model d) {
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",service.getApprvList(sch));
		return "WEB-INF\\jongeunView\\apprvList.jsp";
	}
	// http://localhost:7080/FinalPJT/reqApprvList.do?prjno=41
	@RequestMapping("/reqApprvList.do")
	public String reqApprvList(@RequestParam("prjno") int prjno, @ModelAttribute("sch") GanttSch sch, Model d) {
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",service.getReqApprvList(sch));
		return "WEB-INF\\jongeunView\\reqApprvList.jsp";
	}
}

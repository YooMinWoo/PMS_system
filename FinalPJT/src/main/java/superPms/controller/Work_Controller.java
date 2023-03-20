package superPms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Alert_Service;
import superPms.service.Gantt_Service;
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
	@Autowired(required = false)
	private Gantt_Service gantt_service;
	@Autowired(required = false)
	private Alert_Service alert_service;
	@Value("${user.upload}")
	private String upload;
	// gantt 연동
	// http://localhost:7080/FinalPJT/PMSLogin.do
	// http://49.238.187.241:7080/FinalPJT/PMSLogin.do
	// http://localhost:7080/FinalPJT/workGanttList.do?prjno=41
	@RequestMapping("/workGanttList.do")
	public String workGanttList(@RequestParam("prjno") int prjno, @ModelAttribute("gsch") GanttSch gsch, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",service.showGantt(gsch));
		return "WEB-INF\\jongeunView\\workGanttList.jsp";
	}
	@GetMapping("/workGanttDetail.do")
	public String workGanttDetail(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		d.addAttribute("projectInfo",service.projectInfo(service.ganttDetailExp(no).getPrjno()));
		d.addAttribute("personInfo",service.personInfo(no));
		d.addAttribute("ganttDetail",service.ganttDetailExp(no));
		d.addAttribute("sessmem",mem);
		if(service.ganttDetailExp(no).getParent()!=null) {
			d.addAttribute("parent",service.ganttDetailExp(service.ganttDetailExp(no).getParent()));
		}
		if(service.getWorkRepList(no).size()>0) {
			d.addAttribute("workrep",service.getWorkRepList(no));
			d.addAttribute("fileInfo",service.getFileList(no));
		}
		return "WEB-INF\\jongeunView\\workGanttDetail.jsp";
	}
	// 진행률 수정
	@PostMapping("/progress.do")
	public String progress(@ModelAttribute("upt") Gantt upt, HttpSession session) {
		service.progress(upt);
		return "redirect:/workGanttDetail.do?no="+upt.getId();
	}
	// 삭제
	@GetMapping("/workDel.do")
	public String workDel(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		int prjno = service.ganttDetailExp(no).getPrjno();
		gantt_service.delGantt(no);
		d.addAttribute("msg","삭제완료");
		return "redirect:/workGanttList.do?prjno="+prjno;
	}
	
	// 수정
	@GetMapping("/workUptFrm.do")
	public String workUptFrm(@RequestParam("no") String no, HttpSession session, Model d) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		d.addAttribute("projectInfo",service.projectInfo(service.ganttDetailExp(no).getPrjno()));
		d.addAttribute("ganttDetail",service.ganttDetailExp(no));
		return "WEB-INF\\jongeunView\\workGanttUptFrm.jsp";
	}
	@PostMapping("/workUpt.do")
	public String workUpt(@ModelAttribute("upt") Gantt upt, HttpSession session, Model d) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		gantt_service.uptProgress(upt);
		d.addAttribute("msg","수정완료");
		return "redirect:/workGanttDetail.do?no="+upt.getId();
	}

	// 답글
	@PostMapping("/workRepIns.do")
	public String workRepIns(WorkRep ins, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		service.insWorkRep(ins);
		return "redirect:/workGanttDetail.do?no="+ins.getWorkno();
	}
	@GetMapping("/workRepDel.do")
	public String workRepDel(@RequestParam("no") int no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		service.delWorkRep(no);
		d.addAttribute("msg","삭제완료");
		return "redirect:/workGanttDetail.do";
	}
	@GetMapping("/downWorkFile.do")
	public String downWorkFile(@RequestParam("fno")int fno,Model d) {
		d.addAttribute("downloadFile", service.fileInfo(fno).getFname());
		d.addAttribute("path", upload);
		return "downloadViewer";
	}
	// 결재
	@GetMapping("/reqApprove.do")
	public String reqApprove(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		service.reqApprove(no);
		d.addAttribute("msg","결재요청");
		return "redirect:/workGanttDetail.do?no="+no;
	}
	@GetMapping("/rejApprove.do")
	public String rejApprove(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		service.rejApprove(no);
		d.addAttribute("msg","결재반려");
		return "redirect:/workGanttDetail.do?no="+no;
	}
	@GetMapping("/approve.do")
	public String approve(@RequestParam("no") String no, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		service.approve(no);
		d.addAttribute("msg","결재승인");
		return "redirect:/workGanttDetail.do?no="+no;
	}
	// 결재함
	// http://localhost:7080/FinalPJT/apprvList.do?prjno=41
	@RequestMapping("/apprvList.do")
	public String apprvList(@RequestParam("prjno") int prjno, @ModelAttribute("asch") GanttSch asch, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",service.getApprvList(asch));
		return "WEB-INF\\jongeunView\\apprvList.jsp";
	}
	// http://localhost:7080/FinalPJT/reqApprvList.do?prjno=41
	@RequestMapping("/reqApprvList.do")
	public String reqApprvList(@RequestParam("prjno") int prjno, @ModelAttribute("sch") GanttSch sch, Model d, HttpSession session) {
		SuperEmpDept mem = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("alertList", alert_service.alertList(mem.getId()));
		d.addAttribute("projectInfo",service.projectInfo(prjno)); 
		d.addAttribute("ganttInfo",service.getReqApprvList(sch));
		return "WEB-INF\\jongeunView\\reqApprvList.jsp";
	}
}

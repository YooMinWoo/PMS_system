package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Work_Service;
import superPms.vo.Work;
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
		if(service.getWorkRepList(no).size()>0) {
			d.addAttribute("workrep",service.getWorkRepList(no));
		}
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
}

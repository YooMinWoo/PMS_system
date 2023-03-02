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
	@RequestMapping("/worklist.do")
	public String worklist(@ModelAttribute("sch") WorkSch sch, Model d) {
		d.addAttribute("worklist",service.getWorkList(sch));
		return "WEB-INF\\jongeunView\\workList.jsp";
	}
	// http://localhost:7080/FinalPJT/workInsFrm.do
	@GetMapping("/workInsFrm.do")
	public String workInsFrm() {
		return "WEB-INF\\jongeunView\\workIns.jsp";
	}
	@PostMapping("/workIns.do")
	public String workIns(Work ins, Model d) {
		service.insWork(ins);
		d.addAttribute("msg","등록이 완료되었습니다.");
		return "WEB-INF\\jongeunView\\workIns.jsp";
	}
	// http://localhost:7080/FinalPJT/workDetail.do?no=1
	@GetMapping("/workDetail.do")
	public String workDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("work",service.getWork(no));
		return "WEB-INF\\jongeunView\\workDetail.jsp";
	}
	@GetMapping("/workUptFrm.do")
	public String workUptFrm(@RequestParam("no") int no, Model d) {
		d.addAttribute("work",service.getWork(no));
		return "WEB-INF\\jongeunView\\workUpt.jsp";
	}
	@PostMapping("/workUpt.do")
	public String workUpt(Work upt, Model d) {
		service.uptWork(upt);
		d.addAttribute("work",service.getWork(upt.getWorkno()));
		d.addAttribute("msg","수정완료");
		return "WEB-INF\\jongeunView\\workUpt.jsp";
	}
	@GetMapping("/delWork.do")
	public String delWork(@RequestParam("no") int no, Model d) {
		service.delWork(no);
		d.addAttribute("msg","삭제완료");
		return "WEB-INF\\jongeunView\\workDetail.jsp";
	}
}

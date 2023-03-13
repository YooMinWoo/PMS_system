package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Gantt_Service;
import superPms.vo.Gantt;
import superPms.vo.Link;

@Controller
public class Gantt_Controller {
	@Autowired(required = false)
	private Gantt_Service service;
	
	@RequestMapping("/showGantt.do")
	public String showGantt(@RequestParam("prjno") int prjno,Gantt g,Model d) {
		d.addAttribute("tasks",service.showGantt(g));
		d.addAttribute("links",service.showLink(prjno));
		return "pageJsonReport";
	}
	
	@RequestMapping("/insGantt.do")
	public String insGantt(Gantt ins) {
		service.insGantt(ins);
		return "pageJsonReport";
	}
	
	@PostMapping("/uptGantt.do")
	public String uptGantt(Gantt upt) {
		service.uptGantt(upt);
		return "pageJsonReport";
	}
	@PostMapping("/delGantt.do")
	public String delGantt(@RequestParam("id")String id) {
		service.delGantt(id);
		service.delLink2(id); // 간트가 지워지면 연결된 링크도 지워지게
		return "pageJsonReport";
	}
	@PostMapping("/insLink.do")
	public String insLink(Link ins) {
		service.insLink(ins);
		System.out.println(ins.getPrjno());
		return "pageJsonReport";
	}
	@PostMapping("/delLink.do")
	public String delLink(@RequestParam("id")String id) {
		service.delLink(id);
		return "pageJsonReport";
	}
	@PostMapping("/uptProgress.do")
	public String uptProgress(Gantt upt) {
		service.uptProgress(upt);
		return "pageJsonReport";
	}
}

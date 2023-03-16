package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Chart_Service;
import superPms.vo.BarChart;

@Controller
public class Chart_Controller {
	@Autowired(required = false)
	private Chart_Service service;
	
	@GetMapping("/PMSMain.do")
	public String PMSMain() {
		return "WEB-INF\\wonjuView\\pmsMain.jsp";
	}
	@GetMapping("/chartShow.do")
	public String chartShow(BarChart date,Model d) {
		System.out.println(date.getYear());
		System.out.println(date.getMonth());
		d.addAttribute("barC",service.getBar(date));
		d.addAttribute("donutC",service.getDonut());
		d.addAttribute("infoByMonth",service.infoByMonth(date.getYear()));
		d.addAttribute("totAmount",service.totAmount(date.getYear()));
		d.addAttribute("infoPm",service.infoPm());
		d.addAttribute("infoEmp",service.infoEmp());
		d.addAttribute("infoRisk",service.infoRisk());
		return "pageJsonReport";
	}
	
	@GetMapping("/projectChart.do")
	public String projectChart(@RequestParam("prjno") int prjno,Model d) {
		System.out.println(prjno);
		d.addAttribute("memRate",service.rateByMember(prjno));
		d.addAttribute("totRate",service.totRate(prjno));
		return "pageJsonReport";
	}
}

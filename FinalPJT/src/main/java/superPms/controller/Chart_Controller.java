package superPms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Alert_Service;
import superPms.service.Chart_Service;
import superPms.vo.BarChart;
import superPms.vo.SuperEmpDept;

@Controller
public class Chart_Controller {
	@Autowired(required = false)
	private Chart_Service service;
	@Autowired
	private Alert_Service alert_service;
	
	
	@GetMapping("/PMSMain.do")
	public String PMSMain(HttpSession session, Model d) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		if(sObj!=null) {
			d.addAttribute("alertList", alert_service.alertList(sObj.getId()));
		}
		return "WEB-INF\\wonjuView\\pmsMain.jsp";
	}
	@GetMapping("/chartShow.do")
	public String chartShow(BarChart date,Model d) {
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

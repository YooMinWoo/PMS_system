package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.SuperEmp_Service;
import superPms.vo.SuperEmpDept;

@Controller
public class SuperEmp_Controller {
	@Autowired(required=false)
	private SuperEmp_Service service;
	
	// http://localhost:5080/FinalPJT/getEmpList.do
	@RequestMapping("/getEmpList.do")
	public String getEmpList(@ModelAttribute("sch") SuperEmpDept sch,Model d) {
		d.addAttribute("elist", service.getEmpList(sch));
		return "WEB-INF\\eunbeenView\\empManage.jsp";
	}
}

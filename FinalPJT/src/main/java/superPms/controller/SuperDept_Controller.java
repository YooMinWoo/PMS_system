package superPms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.SuperDept_Service;
import superPms.vo.DeptCode;
import superPms.vo.DeptSch;
import superPms.vo.SuperDept;

@Controller
public class SuperDept_Controller {
	@Autowired(required=false)
	private SuperDept_Service service;
	
	// http://localhost:5080/FinalPJT/superDeptList.do
	@RequestMapping("/superDeptList.do")
	public String superDeptList(@ModelAttribute("sch") DeptSch sch,Model d) {
		d.addAttribute("list", service.superDeptList(sch));
		return "WEB-INF\\eunbeenView\\deptManage.jsp";
	}
	@ModelAttribute("getParentDeptCom")
	public List<DeptCode> getParentDeptComb(){
		return service.getParentDeptComb();
	}
	@RequestMapping("insertDept.do")
	public String insertDept(SuperDept ins, Model d){
		service.insertDept(ins);
		d.addAttribute("msg","부서추가!");
	 	return "WEB-INF\\eunbeenView\\deptManage.jsp";
	}	
	// 부서명 중복체크 
	// http://localhost:5080/FinalPJT/dnameChk.do?dname=회
	@RequestMapping("/dnameChk.do")
	public String dnameChk(@RequestParam("dname") String dname, Model d) {
		d.addAttribute("dnameCheck", service.dnameChk(dname));
		return "pageJsonReport";
	}
	// http://localhost:5080/FinalPJT/deptidCheck.do?deptid=de100
	@RequestMapping("/deptidChk.do")
	public String deptidChk(@RequestParam("deptid") String deptid, Model d) {
		d.addAttribute("deptidCheck", service.deptidChk(deptid));
		return "pageJsonReport";
	}
	@GetMapping("/deleteDept.do")
	public String deleteDept(@RequestParam("deptid") String deptid, Model d) {
		service.deleteDept(deptid);
		d.addAttribute("msg", "삭제완료!");
		return "WEB-INF\\eunbeenView\\deptManage.jsp";
	}
}

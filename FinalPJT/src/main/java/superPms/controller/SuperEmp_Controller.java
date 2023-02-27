package superPms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.SuperEmp_Service;
import superPms.vo.DeptCode;
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
	// 아이디 중복체크 
	// http://localhost:5080/FinalPJT/idChk.do?id=t711txt@gmail.com
	@RequestMapping("/idChk.do")
	public String idChk(@RequestParam("id") String id, Model d) {
		d.addAttribute("idCheck", service.idChk(id));
		return "pageJsonReport";
	}
	@RequestMapping("/cellChk.do")
	public String cellChk(@RequestParam("cell") String cell, Model d) {
		d.addAttribute("cellCheck", service.cellChk(cell));
		return "pageJsonReport";
	}
	@ModelAttribute("getParentDeptCom")
	public List<DeptCode> getParentDeptComb(){
		return service.getParentDeptComb();
	}
	@RequestMapping("insertEmp.do")
	public String insertEmp(SuperEmpDept ins, Model d){
		service.insertEmp(ins);
		d.addAttribute("msg","계정생성 완료!");
	 	return "WEB-INF\\eunbeenView\\empManage.jsp";
	}	
	@GetMapping("/deleteEmp.do")
	public String deleteEmp(@RequestParam("id") String id, Model d) {
		service.deleteEmp(id);
		d.addAttribute("msg", "사원삭제 완료!");
		return "WEB-INF\\eunbeenView\\empManage.jsp";
	}
	@GetMapping("/authSetting.do")
	public String getAuthSetting(@RequestParam("id") String id, Model d) {
		d.addAttribute("authSet", service.getAuthSetting(id));
		return "WEB-INF\\eunbeenView\\authSetting.jsp";
	}
	@ModelAttribute("jobCom")
	public List<String> getJobCom(){
		return service.getJobCom();
	}
	@ModelAttribute("authCom")
	public List<String> getAuthCom(){
		return service.getAuthCom();
	}
	@RequestMapping("/updateEmp.do")
	public String uptEmp(SuperEmpDept upt, Model d) {
		service.uptEmp(upt);
		// 수정된 이후에 데이터를 로딩 처리
		d.addAttribute("authSet", service.getAuthSetting(upt.getId()));
		return "WEB-INF\\eunbeenView\\authSetting.jsp";
	} 
}

package superPms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.SuperDept_Service;
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
	// 상품종류 콤보박스
	@ModelAttribute("parentDeptCom")
	public List<String> getParentDeptComb(){
		return service.getParentDeptComb();
	}
}

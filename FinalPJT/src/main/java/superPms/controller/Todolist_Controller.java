package superPms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Todolist_Service;
import superPms.vo.SuperEmpDept;
import superPms.vo.Todolist;

@Controller
public class Todolist_Controller {
	
	@Autowired
	private Todolist_Service service;
	// http://localhost:7080/FinalPJT/todoList.do
	// http://localhost:7080/FinalPJT/PMSLogin.do

//	@GetMapping("/todoList.do")
//	public String todoList() {
//		
//		return "WEB-INF\\suminView\\TodoList.jsp";
//	}
	
	@RequestMapping("/todoList.do")
	public String todoAjax(Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		d.addAttribute("todoList",service.todoList(sObj.getId()));
		return "WEB-INF\\suminView\\TodoList.jsp";
	}
	
	@RequestMapping("/todoListAjax.do")
	public String todoSchList(Todolist sch,HttpSession session,Model d) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		sch.setId(sObj.getId());
		d.addAttribute("todoList", service.todoSchList(sch));
		return "pageJsonReport";
	}
	
	@RequestMapping("/insTodo.do")
	public String insTodo(Todolist ins,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		ins.setId(sObj.getId());
		service.insTodo(ins);
		d.addAttribute("msg", "등록이 완료되었습니다");
		return "pageJsonReport";
	}
	
	@RequestMapping("/uptcomStateTodo.do")
	public String uptcomStateTodo(@RequestParam("tno")String tno,Model d) {
		service.uptcomStateTodo(tno);
		d.addAttribute("msg", "완료처리 되었습니다.");
		return "pageJsonReport";
	}
	@RequestMapping("/uptincomStateTodo.do")
	public String uptincomStateTodo(@RequestParam("tno")String tno,Model d) {
		service.uptincomStateTodo(tno);
		d.addAttribute("msg", "미완료처리 되었습니다.");
		return "pageJsonReport";
	}
	
	@RequestMapping("/delTodo.do")
	public String delTodo(@RequestParam("tno")String tno,Model d) {
		service.delTodo(tno);
		d.addAttribute("msg", "삭제되었습니다.");
		return "pageJsonReport";
	}
	
	@RequestMapping("/uptTodo.do")
	public String uptTodo(Todolist upt,Model d,HttpSession session) {
		SuperEmpDept sObj = (SuperEmpDept)session.getAttribute("emp");
		upt.setId(sObj.getId());
		service.uptTodo(upt);
		d.addAttribute("msg", "수정되었습니다.");
		return "pageJsonReport";
	}
	
	
}

package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.Todolist_Service;
import superPms.vo.Todolist;

@Controller
public class Todolist_Controller {
	
	@Autowired
	private Todolist_Service service;
	// http://localhost:7080/FinalPJT/todoList.do
	@GetMapping("/todoList.do")
	public String todoList() {
		
		return "WEB-INF\\suminView\\TodoList.jsp";
	}
	
	@RequestMapping("/insTodo.do")
	public String insTodo(Todolist ins,Model d) {
		service.insTodo(ins);
		d.addAttribute("msg", "할일 등록 완료");
		return "pageJsonReport";
	}
}

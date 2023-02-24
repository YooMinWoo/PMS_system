package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Todolist_Service;
import superPms.vo.Todolist;

@Controller
public class Todolist_Controller {
	
	@Autowired
	private Todolist_Service service;
	// http://localhost:7080/FinalPJT/todoList.do
//	@GetMapping("/todoList.do")
//	public String todoList() {
//		
//		return "WEB-INF\\suminView\\TodoList.jsp";
//	}
	
	@RequestMapping("/todoList.do")
	public String todoAjax(Model d) {
		String id="monsta@gmail.com";
		d.addAttribute("todoList",service.todoList(id));
		return "WEB-INF\\\\suminView\\\\TodoList.jsp";
	}
	
	@RequestMapping("/insTodo.do")
	public String insTodo(Todolist ins,Model d) {
		service.insTodo(ins);
		d.addAttribute("msg", "등록이 완료되었습니다");
		return "pageJsonReport";
	}
	
	@RequestMapping("/uptStateTodo.do")
	public String uptStateTodo(@RequestParam("tno")String tno,Model d) {
		service.uptStateTodo(tno);
		d.addAttribute("msg", "완료처리 되었습니다.");
		return "pageJsonReport";
	}
	
	@RequestMapping("/delTodo.do")
	public String delTodo(@RequestParam("tno")String tno,Model d) {
		service.delTodo(tno);
		d.addAttribute("msg", "삭제되었습니다.");
		return "pageJsonReport";
	}
	
	@RequestMapping("/uptTodo.do")
	public String uptTodo(Todolist upt,Model d) {
		service.uptTodo(upt);
		d.addAttribute("msg", "수정되었습니다.");
		return "pageJsonReport";
	}
}

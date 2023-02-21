package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import superPms.service.Todolist_Service;

@Controller
public class Todolist_Controller {
	
//	@Autowired
//	private Todolist_Service service;
	// http://localhost:7080/FinalPJT/todoList.do
	@GetMapping("/todoList.do")
	public String todoList() {
		
		return "WEB-INF\\suminView\\TodoList.jsp";
	}
}

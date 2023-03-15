package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Todolist_Dao;
import superPms.vo.Todolist;

@Service
public class Todolist_Service {
	
	@Autowired
	private Todolist_Dao dao;
	public void insTodo(Todolist ins) {
		dao.insTodo(ins);
	}
	public List<Todolist> todoList(String id){
		return dao.todoList(id);
	}
	
	public void uptStateTodo(String tno) {
		dao.uptStateTodo(tno);
	}
	
	public void delTodo(String tno) {
		dao.delTodo(tno);
	}
	
	public void uptTodo(Todolist upt) {
		dao.uptTodo(upt);
	}
	
	public List<Todolist> todoSchList(Todolist sch){
		if(sch.getTodo()==null) sch.setTodo("");
		return dao.todoSchList(sch);
	}
}

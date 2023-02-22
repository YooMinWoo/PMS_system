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
}

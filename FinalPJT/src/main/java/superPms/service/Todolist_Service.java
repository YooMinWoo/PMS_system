package superPms.service;

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
}

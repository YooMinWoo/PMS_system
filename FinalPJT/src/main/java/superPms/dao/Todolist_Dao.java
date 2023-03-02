package superPms.dao;

import java.util.List;

import superPms.vo.Todolist;

public interface Todolist_Dao {

	public void insTodo(Todolist ins);
	
	public List<Todolist> todoList(String id);
	
	public void uptStateTodo(String tno);
	
	public void delTodo(String tno);
	
	public void uptTodo(Todolist upt);
	
}

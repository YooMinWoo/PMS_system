package superPms.vo;

public class Todolist {
	private String tno;
	private String todo;
	private String state;
	private String id;
	
	public Todolist(String tno, String todo, String state, String id) {
		this.tno = tno;
		this.todo = todo;
		this.state = state;
		this.id = id;
	}
	public Todolist() {
		// TODO Auto-generated constructor stub
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTodo() {
		return todo;
	}
	public void setTodo(String todo) {
		this.todo = todo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}

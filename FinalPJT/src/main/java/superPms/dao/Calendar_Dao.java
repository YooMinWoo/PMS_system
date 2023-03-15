package superPms.dao;

import java.util.List;

import superPms.vo.Alert;
import superPms.vo.Calendar;
import superPms.vo.Project;

public interface Calendar_Dao {
	
	public List<Calendar> calList(String id);
	
	public void insCalendar(Calendar ins);
	
	public void uptCalendar(Calendar upt);
	
	public void delCalendar(int id);
	
	public List<Alert> alertList(String id);
	public int alertCount(String id);
	public void alertState(int no);
	
	public List<Project> getProSch(String id);
	public void insCalPro(Calendar ins);
}

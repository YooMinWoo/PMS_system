package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Calendar_Dao;
import superPms.vo.Alert;
import superPms.vo.Calendar;
import superPms.vo.Project;

@Service
public class Calendar_Service {

	@Autowired
	private Calendar_Dao dao;
	
	public List<Calendar> calList(String id){
		return dao.calList(id);
	}
	
	public void insCalendar(Calendar ins) {
		dao.insCalendar(ins);
	}
	public void uptCalendar(Calendar upt) {
		dao.uptCalendar(upt);
	}
	public void delCalendar(int id) {
		dao.delCalendar(id);
	}
	
	public List<Alert> alertList(String id){
		return dao.alertList(id);
	}
	public int alertCount(String id) {
		return dao.alertCount(id);
	}
	public void alertState(int no) {
		dao.alertState(no);
	}
	public List<Project> getProSch(String id){
		return dao.getProSch(id);
	}
	public void insCalPro(Calendar ins) {
		dao.insCalPro(ins);
	}
	
}

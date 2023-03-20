package superPms.service;

import java.util.ArrayList;
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
	
	
	
	public List<Project> getProSch(String id){
		return dao.getProSch(id);
	}
	public void insCalPro(Calendar ins) {
		dao.insCalPro(ins);
	}
	public List<Calendar> getTitle(String writer){
		return dao.getTitle(writer);
	}
	
	
}

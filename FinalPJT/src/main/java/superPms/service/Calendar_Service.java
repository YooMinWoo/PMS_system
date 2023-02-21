package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Calendar_Dao;
import superPms.vo.Calendar;

@Service
public class Calendar_Service {

	@Autowired
	private Calendar_Dao dao;
	
	public List<Calendar> calList(){
		return dao.calList();
	}
	
	public void insCalendar(Calendar ins) {
		dao.insCalendar(ins);
	}
	public void uptCalendar(Calendar upt) {
		dao.uptCalendar(upt);
	}
	public void delCalendar(int calno) {
		dao.delCalendar(calno);
	}
}

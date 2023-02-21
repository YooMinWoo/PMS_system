package superPms.dao;

import java.util.List;

import superPms.vo.Calendar;

public interface Calendar_Dao {
	public List<Calendar> calList();
	public void insCalendar(Calendar ins);
}

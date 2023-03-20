package superPms.dao;

import java.util.List;

import superPms.vo.Alert;

public interface Alert_Dao {
	
	public List<Alert> alertList(String id);
	public int alertCount(String id);
	
	public void alertState(String no);
	
	public void alertDelete(int no);
}

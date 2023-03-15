package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Alert_Dao;
import superPms.vo.Alert;

@Service
public class Alert_Service {

	@Autowired
	private Alert_Dao dao;
	
	public List<Alert> alertList(String id){
		return dao.alertList(id);
	}
	public int alertCount(String id) {
		return dao.alertCount(id);
	}
	public void alertState(int no) {
		dao.alertState(no);
	}
	
	public void alertDelete(int no) {
		dao.alertDelete(no);
	}
}

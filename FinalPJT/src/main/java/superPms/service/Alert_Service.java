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
	
}

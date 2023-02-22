package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Work_Dao;
import superPms.vo.Work;

@Service
public class Work_Service {
	@Autowired(required=false)
	private Work_Dao dao;
	
	public List<Work> getWorkList(){
		return dao.getWorkList();
	}
}

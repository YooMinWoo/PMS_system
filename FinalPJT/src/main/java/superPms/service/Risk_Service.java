package superPms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import superPms.dao.Risk_Dao;
import superPms.vo.Risk;

@Service
public class Risk_Service {
	private Risk_Dao dao;
	public List<Risk> riskList(Risk sch){
		return dao.riskList(sch);
	}
}

package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Risk_Dao;
import superPms.vo.Risk;

@Service
public class Risk_Service {
	@Autowired(required=false)
	private Risk_Dao dao;
	public List<Risk> riskList(Risk sch){
		return dao.riskList(sch);
	}
	public Risk getRisk(int riskno) {
		return dao.getRisk(riskno);
	}
}

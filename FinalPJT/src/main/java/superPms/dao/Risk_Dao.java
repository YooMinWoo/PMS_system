package superPms.dao;

import java.util.List;

import superPms.vo.Risk;


public interface Risk_Dao {
	public List<Risk> riskList(Risk sch);
	public Risk getRisk(int riskno);
	public void insertRisk(Risk ins);
	public void updateRisk(Risk upt);
}

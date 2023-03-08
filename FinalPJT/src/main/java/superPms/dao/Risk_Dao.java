package superPms.dao;

import java.util.List;

import superPms.vo.Risk;
import superPms.vo.RiskSch;


public interface Risk_Dao {
	public List<Risk> riskList(Risk sch);
	public List<Risk> pagingRisk(RiskSch sch);
	public int totCnt(RiskSch sch);
	public Risk getRisk(int riskno);
	public void insertRisk(Risk ins);
	public void updateRisk(Risk upt);
	public void deleteRisk(Risk del);
}

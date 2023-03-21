package superPms.dao;

import java.util.List;

import superPms.vo.Risk;
import superPms.vo.RiskSch;
import superPms.vo.Strategy;
import superPms.vo.Strategycare;
import superPms.vo.StrategycareSch;


public interface Risk_Dao {
	public List<Risk> riskList(Risk sch);
	
	public List<Risk> pagingRisk(RiskSch sch);
	public int totCnt(RiskSch sch);
	
	public Risk getRisk(int riskno);
	public void insertRisk(Risk ins);
	public void updateRisk(Risk upt);
	public void updateRisk2(Risk upt);
	public void deleteRisk(Risk del);
	
	public Strategy getStrategy(int strategyno);
	
	public void insertStrategy(Strategy ins);
	
	public List<Strategy> pagingCare(StrategycareSch sch);
	public int totCntCare(StrategycareSch sch);
	public void insertCare(Strategycare ins);
}

package superPms.dao;

import java.util.List;

import superPms.vo.Solution;
import superPms.vo.SolutionSch;



public interface Solution_Dao {
	public List<Solution> pagingSol(SolutionSch sol);
	public int totCnt(SolutionSch sch);
	public void insertSol(Solution ins);
	public void updateSol(Solution upt);
	public void deleteSol(Solution del);
}

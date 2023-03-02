package superPms.dao;

import java.util.List;

import superPms.vo.Work;
import superPms.vo.WorkSch;

public interface Work_Dao {
	public List<Work> getWorkList(WorkSch sch);
	public void insWork(Work ins);
	public Work getWork(int no);
	public void uptWork(Work upt);
	public void delWork(int no);
}

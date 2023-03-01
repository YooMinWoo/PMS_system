package superPms.dao;

import java.util.List;

import superPms.vo.Work;

public interface Work_Dao {
	public List<Work> getWorkList();
	public void insWork(Work ins);
	public Work getWork(int no);
//	public void delWork(Work del);
}

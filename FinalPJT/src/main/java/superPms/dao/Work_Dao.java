package superPms.dao;

import java.util.List;

import superPms.vo.Work;

public interface Work_Dao {
	public List<Work> getWorkList();
	public Work getWorkDetail();
	public void insWork(Work ins);
	public void delWork(Work del);
}

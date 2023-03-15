package superPms.dao;

import java.util.List;

import superPms.vo.Gantt;
import superPms.vo.GanttSch;
import superPms.vo.Project;
import superPms.vo.Work;
import superPms.vo.WorkFile;
import superPms.vo.WorkRep;
import superPms.vo.WorkSch;

public interface Work_Dao {
	public List<Work> getWorkList();
	public List<Work> schWork(WorkSch sch);
	public void insWork(Work ins);
	public void insFile(WorkFile ins);
	public Work getWork(int no);
	public void uptWork(Work upt);
	public void delWork(int no);
	// 페이징
	public int totCnt(WorkSch sch);
	// 답글
	public List<WorkRep> getWorkRepList(String no);
	public void insWorkRep(WorkRep ins);
	public void delWorkRep(int no);
	// gantt
	public List<Gantt> showGantt(GanttSch sch);
	public int totGanttCnt(GanttSch sch);
	public Project projectInfo(int prjno);
	public Gantt ganttDetail(Gantt det);
	public Gantt ganttDetailExp(String no);
}

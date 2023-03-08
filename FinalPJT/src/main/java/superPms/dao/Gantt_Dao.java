package superPms.dao;

import java.util.List;

import superPms.vo.Gantt;
import superPms.vo.Link;

public interface Gantt_Dao {
	public List<Gantt> showGantt(int prjno);
	public List<Link> showLink(int prjno);
	public void insGantt(Gantt ins);
	public void uptGantt(Gantt upt);
	public void delGantt(String id);
	public void insLink(Link ins);
	public void delLink(String id);
	public void delLink2(String gid);
	
	public Gantt getMinMaxDate(int prjno);
	public Gantt ganttDetail(Gantt det);
	public void uptProgress(Gantt upt);
}

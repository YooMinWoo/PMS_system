package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Gantt_Dao;
import superPms.vo.Gantt;
import superPms.vo.Link;

@Service
public class Gantt_Service {
	@Autowired(required = false)
	private Gantt_Dao dao;
	
	public List<Gantt> showGantt(int prjno){
		return dao.showGantt(prjno);
	}
	public List<Link> showLink(int prjno){
		return dao.showLink(prjno);
	}
	public void insGantt(Gantt ins) {
		if(ins.getOwner()==null) ins.setOwner(" ");
		dao.insGantt(ins);
	}
	public void uptGantt(Gantt upt) {
		dao.uptGantt(upt);
	};
	public void insLink(Link ins) {
		dao.insLink(ins);
	}
	public void delLink(String id) {
		dao.delLink(id);
	};
	public void delGantt(String id) {
		dao.delGantt(id);
	};
	public void delLink2(String gid) {
		dao.delLink2(gid);
	};
	public Gantt getMinMaxDate(int prjno) {
		return dao.getMinMaxDate(prjno);
	};
}

package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Work_Dao;
import superPms.vo.Work;
import superPms.vo.WorkSch;

@Service
public class Work_Service {
	@Autowired(required=false)
	private Work_Dao dao;
	public List<Work> getWorkList(){
		return dao.getWorkList();
	}
	public List<Work> schWork(WorkSch sch){
		if(sch.getSubject()==null) sch.setSubject("");
		return dao.schWork(sch);
	}
	public Work getWork(int no) {
		return dao.getWork(no);
	}
	public void insWork(Work ins) {
		dao.insWork(ins);
	}
	public void uptWork(Work upt) {
		dao.uptWork(upt);
	}
	public void delWork(int no) {
		dao.delWork(no);
	}

}

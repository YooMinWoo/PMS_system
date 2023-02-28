package superPms.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Project_Dao;
import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.SuperDept;

@Service
public class Project_Service {
	@Autowired(required = false)
	private Project_Dao dao;
	
	public Integer insProject(Project ins,ProjectMember ins2) {
		dao.insProject(ins);	
		for(int i=0;i<ins2.getOwners().length;i++) {
			ProjectMember pm = new ProjectMember();
			pm.setOwner(ins2.getOwners()[i]);
			pm.setPart(ins2.getParts()[i]);
			dao.insProMem(pm);
		}
		return ins.getPrjno();
	}
	
	public List<Project> allProject(String keyword,String isCon) {
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("keyword", keyword);
		map.put("isCon", isCon);	
		return dao.allProject(map);
	}
	
	public List<Project> myProject(String keyword,String isCon,String owner){
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("keyword", keyword);
		map.put("isCon", isCon);
		map.put("owner", owner);
		return dao.myProject(map);
	};
	public List<SuperDept> deptCom(){
		return dao.deptCom();
	}
	
	public Project projectInfo(int prjno) {
		return dao.projectInfo(prjno);
	};
}

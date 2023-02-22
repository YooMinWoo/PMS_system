package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Project_Dao;
import superPms.vo.Project;

@Service
public class Project_Service {
	@Autowired(required = false)
	private Project_Dao dao;
	
	public void insProject(Project ins) {
		dao.insProject(ins);
	}
	public  List<Project> allProject(String keyword) {
		return dao.allProject(keyword);
	}
}

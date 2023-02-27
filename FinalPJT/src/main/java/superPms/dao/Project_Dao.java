package superPms.dao;

import java.util.HashMap;
import java.util.List;

import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.SuperDept;

public interface Project_Dao {
	public void insProject(Project ins);
	public List<Project> allProject(HashMap<String, String> map);
	public void insProMem (ProjectMember ins2);
	
	
	public List<SuperDept> deptCom();
}

package superPms.dao;

import java.util.List;

import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.ProjectSch;
import superPms.vo.SuperDept;

public interface Project_Dao {
	public void insProject(Project ins);
	public List<Project> allProject(ProjectSch sch);
	public Integer allProjectTot(ProjectSch sch);
	
	public List<Project> myProject(ProjectSch sch);
	public Integer myProjectTot(ProjectSch sch);
	
	public void insProMem (ProjectMember ins2);
	public void inviteProMem(ProjectMember ins);
	
	public Project projectInfo(int prjno);
	
	public List<SuperDept> deptCom();
	
	

}

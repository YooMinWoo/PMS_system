package superPms.dao;

import java.util.List;

import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.ProjectMemberList;
import superPms.vo.ProjectSch;
import superPms.vo.SuperDept;
import superPms.vo.SuperEmpDept;
import superPms.vo.SuperEmpDeptSch;

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
	
	public Integer empInfoTot(SuperEmpDeptSch sch);
	public List<SuperEmpDept> empInfoList(SuperEmpDeptSch sch);
	
	public List<ProjectMemberList> memberList(int prjno);
	public void uptProInfo(Project upt);
	public void delProject(int prjno);
	public void delProjectMember(ProjectMember del);
}

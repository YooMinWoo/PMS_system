package superPms.dao;

import java.util.List;

import superPms.vo.Project;

public interface Project_Dao {
	public void insProject(Project ins);
	public List<Project> allProject(String keyword);
}

package superPms.dao;

import java.util.List;

import superPms.vo.SuperEmpDept;


public interface SuperEmp_Dao {
	public List<SuperEmpDept> getEmpList(SuperEmpDept sch);
}

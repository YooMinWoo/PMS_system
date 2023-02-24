package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.SuperEmp_Dao;
import superPms.vo.SuperEmpDept;


@Service
public class SuperEmp_Service {
	@Autowired(required=false)
	private SuperEmp_Dao dao;
	
	public List<SuperEmpDept> getEmpList(SuperEmpDept sch){
		if(sch.getEname()==null) sch.setEname("");
	    if(sch.getDname()==null) sch.setDname("");
	    if(sch.getHiredate()==null) sch.setHiredate("");
	    return dao.getEmpList(sch);
	}

}

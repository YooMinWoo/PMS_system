package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.SuperEmp_Dao;
import superPms.vo.DeptCode;
import superPms.vo.SuperEmpDept;


@Service
public class SuperEmp_Service {
	@Autowired(required=false)
	private SuperEmp_Dao dao;
	
	public List<SuperEmpDept> getEmpList(SuperEmpDept sch){
		if(sch.getSename()==null) sch.setSename("");
	    if(sch.getDname()==null) sch.setDname("");
	    if(sch.getJob()==null) sch.setJob("");
	    return dao.getEmpList(sch);
	}
	public SuperEmpDept idChk(String id) {
		return dao.idChk(id);
	}
	public SuperEmpDept cellChk(String cell) {
		return dao.cellChk(cell);
	}
	public void insertEmp(SuperEmpDept ins) {
		dao.insertEmp(ins);
	}
	public void deleteEmp(String id) {
		dao.deleteEmp(id);
	}
	public List<DeptCode> getParentDeptComb(){
		return dao.getParentDeptComb();
	}
	public SuperEmpDept getAuthSetting(String id) {
		return dao.getAuthSetting(id);
	}
	public List<String> getJobCom(){
		return dao.getJobCom();
	}
	public List<String> getAuthCom(){
		return dao.getAuthCom();
	}
	public void uptEmp(SuperEmpDept upt) {
		dao.uptEmp(upt);
	}
	public SuperEmpDept login(SuperEmpDept se) {
		return dao.login(se);
	}
	public void updateMyInfo(SuperEmpDept upt) {
		dao.updateMyInfo(upt);
	}

}

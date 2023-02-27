package superPms.dao;

import java.util.List;

import superPms.vo.DeptCode;
import superPms.vo.DeptSch;
import superPms.vo.SuperDept;

public interface SuperDept_Dao {
	public List<SuperDept> superDeptList(DeptSch sch);
	public int totCnt(DeptSch sch);
	public List<DeptCode> getParentDeptComb();
	public void insertDept(SuperDept ins);
	public SuperDept dnameChk(String dname); // 부서명 중복체크
	public SuperDept deptidChk(String deptid); // 부서코드 중복체크
	public void deleteDept(String deptid); 
}

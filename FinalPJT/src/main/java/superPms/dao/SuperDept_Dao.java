package superPms.dao;

import java.util.List;

import superPms.vo.DeptSch;
import superPms.vo.SuperDept;

public interface SuperDept_Dao {
	public List<SuperDept> superDeptList(DeptSch sch);
	public int totCnt(DeptSch sch);
	public List<String> getParentDeptComb();
}

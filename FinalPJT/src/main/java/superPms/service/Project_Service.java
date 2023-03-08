package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Project_Dao;
import superPms.vo.Project;
import superPms.vo.ProjectMember;
import superPms.vo.ProjectMemberList;
import superPms.vo.ProjectSch;
import superPms.vo.SuperDept;
import superPms.vo.SuperEmpDept;
import superPms.vo.SuperEmpDeptSch;

@Service
public class Project_Service {
	@Autowired(required = false)
	private Project_Dao dao;
	// 프로젝트 등록하면서 멤버까지 같이 등록
	public Integer insProject(Project ins,ProjectMember ins2) {
		dao.insProject(ins);	
		for(int i=0;i<ins2.getOwners().length;i++) {
			ProjectMember pm = new ProjectMember();
			pm.setOwner(ins2.getOwners()[i]);
			pm.setPart(ins2.getParts()[i]);
			dao.insProMem(pm);
		}
		return ins.getPrjno();
	}
	// 나중에 멤버만 따로 추가
	public void inviteProMem(ProjectMember ins) {
		for(int i=0;i<ins.getOwners().length;i++) {
			ProjectMember pm = new ProjectMember();
			pm.setPrjno(ins.getPrjno());
			pm.setOwner(ins.getOwners()[i]);
			pm.setPart(ins.getParts()[i]);
			dao.inviteProMem(pm);
		}
	}
	public List<Project> allProject(ProjectSch sch){
		if(sch.getIsCon()==null) sch.setIsCon("Y");
		if(sch.getKeyword()==null) sch.setKeyword("");
		pagination(sch,7,5,dao.allProjectTot(sch));
		return dao.allProject(sch);
	};
	
	public List<Project> myProject(ProjectSch sch){
		if(sch.getIsCon()==null) sch.setIsCon("Y");
		if(sch.getKeyword()==null) sch.setKeyword("");
		pagination(sch,7,5,dao.myProjectTot(sch));
		return dao.myProject(sch);
	};
	public List<SuperDept> deptCom(){
		return dao.deptCom();
	}
	
	public Project projectInfo(int prjno) {
		return dao.projectInfo(prjno);
	};
	
	public List<ProjectMemberList> memberList(int prjno) {
		return dao.memberList(prjno);
	};
	public ProjectMemberList getPm(int prjno) {
		return dao.getPm(prjno);
	};
	public void uptProInfo(Project upt) {
		dao.uptProInfo(upt);
	};
	public void delProject(int prjno) {
		dao.delProject(prjno);
	};
	public void delProjectMember(ProjectMember del) {
		dao.delProjectMember(del);
	}
	// 페이징 처리(sch, 한번에 보여줄 페이지수, 한번에 보여줄 블럭 수, 전체 게시글갯수)
	public void pagination(ProjectSch sch,int pageSize, int blockSize, int tot ) {
		sch.setCount(tot); // 전체 데이터 건수
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		sch.setPageSize(pageSize); // 한 번에 보일 데이터 갯수
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));// 전체 페이지 수		
		// 블럭 이후 버튼에 대한 예외 처리
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}	
		// 게시글의 마지막 번호 , 시작 번호
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);		
		// 블럭 크기
		sch.setBlockSize(blockSize);
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
	}

	// 사원 검색 서비스
	public List<SuperEmpDept> empInfoList(SuperEmpDeptSch sch){
		if(sch.getKeyword()==null) sch.setKeyword("");
		pagination2(sch, 4, 5, dao.empInfoTot(sch));
		return dao.empInfoList(sch);
	};
	
	
	// 사원검색 페이징 처리(keyword, 한번에 보여줄 페이지수, 한번에 보여줄 블럭 수, 전체 게시글갯수)
	public void pagination2(SuperEmpDeptSch sch,int pageSize, int blockSize, int tot ) {
		sch.setCount(tot); // 전체 데이터 건수
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		sch.setPageSize(pageSize); // 한 번에 보일 데이터 갯수
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));// 전체 페이지 수		
		// 블럭 이후 버튼에 대한 예외 처리
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}	
		// 게시글의 마지막 번호 , 시작 번호
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);		
		// 블럭 크기
		sch.setBlockSize(blockSize);
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
	}
	
}

package superPms.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import superPms.dao.Work_Dao;
import superPms.vo.Gantt;
import superPms.vo.GanttSch;
import superPms.vo.Project;
import superPms.vo.ProjectMemberList;
import superPms.vo.SuperEmpDept;
import superPms.vo.Work;
import superPms.vo.WorkFile;
import superPms.vo.WorkMember;
import superPms.vo.WorkRep;
import superPms.vo.WorkSch;

@Service
public class Work_Service {
	@Value("${user.upload}")
	private String upload;
	@Autowired(required=false)
	private Work_Dao dao;
	public List<Work> getWorkList(){
		return dao.getWorkList();
	}
	public List<Work> schWork(WorkSch sch){
		if(sch.getSubject()==null) sch.setSubject("");
		if(sch.getId()==null) sch.setId("");
		sch.setCount(dao.totCnt(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0) {
			sch.setPageSize(7);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		} 
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.schWork(sch);
	}
	public Work getWork(int no) {
		Work w = dao.getWork(no);
		return w;
	}
	
	private void uploadFile(MultipartFile f){
		String fname = f.getOriginalFilename();
		File fObj = new File(upload+fname);
		try{
			f.transferTo(fObj);
		} catch (IllegalStateException e) {
			System.out.println("파일업로드 예외1 : "+e.getMessage());
		} catch (IOException e) {
			System.out.println("파일업로드 예외2 : "+e.getMessage());
		} 
	}
	public void insWork(Work ins) {
		String fname = ins.getReport().getOriginalFilename();
		if(fname!=null && !fname.equals("")){
			uploadFile(ins.getReport());
			WorkFile f = new WorkFile();
			f.setFname(fname);
			f.setPath(upload);
			dao.insFile(f);
		}
		dao.insWork(ins);
	}
	public void uptWork(Work upt) {
		dao.uptWork(upt);
	}
	public void delWork(int no) {
		dao.delWork(no);
	}
	//답글
	public List<WorkRep> getWorkRepList(String no) {
		return dao.getWorkRepList(no);
	}
	public void insWorkRep(WorkRep ins) {
		String fname = ins.getReport().getOriginalFilename();
		if(fname!=null && !fname.equals("")){
			uploadFile(ins.getReport());
			WorkFile f = new WorkFile();
			f.setFname(fname);
			f.setPath(upload);
			dao.insFile(f);
			dao.insWorkRepFile(ins);
		}else {
			dao.insWorkRep(ins);
		}
	}
	public List<WorkFile> getFileList(String fno) {
		return dao.getFileList(fno);
	}
	public WorkFile fileInfo(int fno) {
		return dao.fileInfo(fno);
	}
	public void delWorkRep(int no) {
		dao.delWorkRep(no);
	}
	// gantt
	public List<Gantt> showGantt(GanttSch sch){
		if(sch.getText()== null) sch.setText("");
		sch.setCount(dao.totGanttCnt(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0) {
			sch.setPageSize(7);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		} 
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.showGantt(sch);
	}
	
	public Project projectInfo(int prjno) {
		return dao.projectInfo(prjno);
	}
	
	public SuperEmpDept personInfo(String no) {
		return dao.personInfo(no);
	}
	
	public Gantt ganttDetail(Gantt det) {
		return dao.ganttDetail(det);
	};
	
	public Gantt ganttDetailExp(String no) {
		return dao.ganttDetailExp(no);
	};
	// 진행률 수정
	public void progress(Gantt upt) {
		dao.progress(upt);
	}
	// 멤버추가
	public List<ProjectMemberList> prjMemList(WorkMember sch){
		return dao.prjMemList(sch);
	}
	// 결재
	public void reqApprove(String no) {
		dao.reqApprove(no);
	}
	public void rejApprove(String no) {
		dao.rejApprove(no);
	}	
	public void approve(String no) {
		dao.approve(no);
	}
	// 결재함
	public List<Gantt> getApprvList(GanttSch sch){
		if(sch.getText()== null) sch.setText("");
		if(sch.getIsApprv()==null) sch.setIsApprv("n");
		sch.setCount(dao.totApprvCnt(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0) {
			sch.setPageSize(7);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		} 
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.getApprvList(sch);
	}
	public List<Gantt> getReqApprvList(GanttSch sch){
		if(sch.getText()== null) sch.setText("");
		sch.setCount(dao.totReqApprvCnt(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0) {
			sch.setPageSize(7);
		}
		sch.setPageCount((int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		} 
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.getReqApprvList(sch);
	}
}

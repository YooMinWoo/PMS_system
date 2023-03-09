package superPms.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import superPms.dao.Work_Dao;
import superPms.vo.Work;
import superPms.vo.WorkFile;
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
	public List<WorkRep> getWorkRepList(int no) {
		return dao.getWorkRepList(no);
	}

}

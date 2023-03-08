package superPms.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import superPms.dao.Work_Dao;
import superPms.vo.Work;
import superPms.vo.WorkFile;
import superPms.vo.WorkSch;

@Service
public class Work_Service {
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
		return dao.getWork(no);
	}
	@Value("${user.upload}")
	private String upload;
	private void uploadFile(MultipartFile f){
		String fname = f.getOriginalFilename();
		File fObj = new File(upload+fname);
		try{
			f.transferTo(fObj);
		}catch(Exception e){
			System.out.println("업로드예외"+e.getMessage());
		}
	}
	public void insWork(Work ins) {
		dao.insWork(ins);
		String fname = ins.getReport().getOriginalFilename();
		if(!fname.equals("")){
			uploadFile(ins.getReport());
			WorkFile f = new WorkFile();
			f.setFname(fname);
			dao.insFile(f);
		}
	}
	public void uptWork(Work upt) {
		dao.uptWork(upt);
	}
	public void delWork(int no) {
		dao.delWork(no);
	}

}

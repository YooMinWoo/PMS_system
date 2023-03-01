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

@Service
public class Work_Service {
	@Autowired(required=false)
	private Work_Dao dao;
	public List<Work> getWorkList(){
		return dao.getWorkList();
	}
	public Work getWork(int no) {
		return dao.getWork(no);
	}
	public void insWork(Work ins) {
		dao.insWork(ins);
	}

}

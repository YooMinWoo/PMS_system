package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import superPms.dao.Drive_Dao;
import superPms.vo.Drive;

@Service
public class Drive_Service {
	@Value("${user.upload}")
	private String upload;
	
	@Autowired
	private Drive_Dao dao;
	
	public List<Drive> driveList(Drive sch) {
		if(sch.getPath()==null || sch.getPath()=="") sch.setPath(upload);
		return dao.driveList(sch);
	}
}

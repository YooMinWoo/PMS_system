package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Notice_Dao;
import superPms.vo.Notice;
import superPms.vo.NoticeSch;

@Service
public class Notice_Service {
	
	@Autowired
	private Notice_Dao dao;
	
	public List<Notice> noticeList(NoticeSch sch){
		if(sch.getSchInfo()==null) sch.setSchInfo("");
		return dao.noticeList(sch);
	};
}

package superPms.dao;

import java.util.List;

import superPms.vo.Notice;
import superPms.vo.NoticeSch;

public interface Notice_Dao {
	public List<Notice> noticeList(NoticeSch sch);
	public Notice noticeDetail(Notice sch);
	public void plusCnt(Notice sch);
	public void insertFile(Notice sch);
	public void insertNotice(Notice sch);
	public int totCnt(NoticeSch sch);
}

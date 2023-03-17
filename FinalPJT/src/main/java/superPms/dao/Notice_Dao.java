package superPms.dao;

import java.util.List;

import superPms.vo.Notice;
import superPms.vo.NoticeRep;
import superPms.vo.NoticeRepSch;
import superPms.vo.NoticeSch;

public interface Notice_Dao {
	public List<Notice> noticeList(NoticeSch sch);
	public Notice noticeDetail(NoticeRepSch sch);
	public Notice schNoticeFile(String no);
	public void plusCnt(NoticeRepSch sch);
	public void insertFile(Notice sch);
	public void insertNotice(Notice sch);
	public int totCnt(NoticeSch sch);
	public void uptNotice(Notice sch);
	public void uptFile(Notice sch);
	public void delNotice(int no);
	public void delNoticeRep(int no);
	public void delNoticeFile(String no);
	public List<NoticeRep> noticeRepList(NoticeRepSch sch);
	public void insertNoticeRep(NoticeRep sch);
	public void deleteNoticeRep(NoticeRep sch);
	public void updateNoticeRep(NoticeRep sch);
	public int totRepCnt(NoticeRepSch sch);
	public int filesCnt(String fname);
}

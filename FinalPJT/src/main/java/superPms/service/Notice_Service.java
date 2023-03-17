package superPms.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import superPms.dao.Notice_Dao;
import superPms.vo.Notice;
import superPms.vo.NoticeRep;
import superPms.vo.NoticeRepSch;
import superPms.vo.NoticeSch;

@Service
public class Notice_Service {
	
	@Value("${user.upload}")
	private String upload;
	
	@Autowired
	private Notice_Dao dao;
	
	public List<Notice> noticeList(NoticeSch sch){
		if(sch.getSchInfo()==null) sch.setSchInfo("");
		if(sch.getDeptid()==null) sch.setDeptid("");
		if(sch.getDeptid().equals("전체")) sch.setDeptid("");
		// 전체페이지 설정
		sch.setCount(dao.totCnt(sch));
		
		// 클릭한 페이지 설정
		
		
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		
		// 한 페이지에 보일 데이터 개수 설정
		sch.setPageSize(10);
		
		// 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
		sch.setPageCount(
			(int)Math.ceil(
			sch.getCount()/(double)sch.getPageSize())
		);
		// 블럭의 [이후]에 대한 예외 처리..( 클릭한 현재 페이지 번호 > 총 페이지 수 ==> 현재 페이지 번호 = 총 페이지 수 )
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		
		// 현재 페이지 마지막 번호( 클릭한 현재 페이지 번호 * 한 페이지에 보여줄 데이터 크기 ) 
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		
		
		// 시작 번호 ( (클릭한 현재 페이지 번호 - 1) * 한 페이지에 보여줄 데이터 크기  + 1)
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		
		// 블럭 크기 지정( 한 번에 보여줄 block의 크기 )
		sch.setBlockSize(5);
		
		
		
		// 블럭 번호 지정 : 현재페이지번호/블럭의 크기     올림 처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/
				(double)sch.getBlockSize());
		
		// 마지막 블럭
		int endBlock = blocknum*sch.getBlockSize();
		
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		
		// 시작 블럭
		sch.setStartBlock( (blocknum-1) * sch.getBlockSize() + 1);
		
		return dao.noticeList(sch);
	};
	
	
	public Notice noticeDetail(NoticeRepSch sch) {
		return dao.noticeDetail(sch);
	}
	public void plusCnt(NoticeRepSch sch) {
		dao.plusCnt(sch);
	}
	
	public String uploadFile(MultipartFile report) {
		String fname = report.getOriginalFilename();
		if(fname!=null && !fname.equals("")) {
			File fObj = new File(upload+fname);
			try {
				report.transferTo(fObj); // 필수 예외 처리 (IO 발생)
			} catch (IllegalStateException e) {
				System.out.println("파일업로드 예외1 : "+e.getMessage());
			} catch (IOException e) {
				System.out.println("파일업로드 예외2 : "+e.getMessage());
			} 
		}
		return fname;
	}
	
	public void deleteFile(Notice f) {
		File file = new File(f.getPath() + f.getFname());
		if(dao.filesCnt(f.getFname())==1) {
			if(file.exists()) { // 파일이 존재하면
				file.delete(); // 파일 삭제	
			}
		}
	}
	
	public void insertFN(Notice f) {
		String fname = uploadFile(f.getReport());
		f.setFname(fname);
		f.setPath(upload);
		
//		if(fname!=null && !fname.equals("")) {
//			dao.insertFile(f);
//		}
		dao.insertFile(f);
		dao.insertNotice(f);
	}
	
	public void uptNotice(Notice n) {
		n.setPath(upload);
		String fname = n.getReport().getOriginalFilename();
		if(n.getBfFname()!=fname && n.getBfFname()!="" && fname!="") {
			n.setFname(n.getBfFname());
			deleteFile(n);
			n.setFname(uploadFile(n.getReport()));
			
			dao.uptFile(n);
		}
		dao.uptNotice(n);
	}
	
	public void delNotice(int[] nos) {
		for(int no : nos) {
			NoticeRepSch sch = new NoticeRepSch();
			sch.setnoticeno(no);
			if(dao.noticeDetail(sch).getFno()!=null) {
				Notice nt = dao.schNoticeFile(dao.noticeDetail(sch).getFno());
				deleteFile(nt);
				dao.delNoticeFile(dao.noticeDetail(sch).getFno());
			}
			
			dao.delNotice(no);
			dao.delNoticeRep(no);
		}
	}
	
	public List<NoticeRep> noticeRepList(NoticeRepSch sch){
		sch.setCount(dao.totRepCnt(sch));
		// 클릭한 페이지 설정
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 한 페이지에 보일 데이터 개수 설정
		sch.setPageSize(10);
		// 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
		sch.setPageCount(
			(int)Math.ceil(
			sch.getCount()/(double)sch.getPageSize())
		);
		// 블럭의 [이후]에 대한 예외 처리..( 클릭한 현재 페이지 번호 > 총 페이지 수 ==> 현재 페이지 번호 = 총 페이지 수 )
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		// 현재 페이지 마지막 번호( 클릭한 현재 페이지 번호 * 한 페이지에 보여줄 데이터 크기 ) 
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		// 시작 번호 ( (클릭한 현재 페이지 번호 - 1) * 한 페이지에 보여줄 데이터 크기  + 1)
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		
		
		
		// 블럭 크기 지정( 한 번에 보여줄 block의 크기 )
		sch.setBlockSize(5);
		// 블럭 번호 지정 : 현재페이지번호/블럭의 크기     올림 처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/
				(double)sch.getBlockSize());
		// 마지막 블럭
		int endBlock = blocknum*sch.getBlockSize();
		
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		// 시작 블럭
		sch.setStartBlock( (blocknum-1) * sch.getBlockSize() + 1);
		return dao.noticeRepList(sch);
	}
	
	public void insertNoticeRep(NoticeRep sch) {
		dao.insertNoticeRep(sch);
	}
	public void deleteNoticeRep(NoticeRep sch) {
		dao.deleteNoticeRep(sch);
	}
	public void updateNoticeRep(NoticeRep sch) {
		dao.updateNoticeRep(sch);
	}
}

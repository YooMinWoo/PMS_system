package superPms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import superPms.dao.Risk_Dao;
import superPms.vo.Risk;
import superPms.vo.RiskSch;
import superPms.vo.Strategy;
import superPms.vo.Strategycare;
import superPms.vo.StrategycareSch;

@Service
public class Risk_Service {
	@Autowired(required=false)
	private Risk_Dao dao;
	public List<Risk> riskList(Risk sch){
		return dao.riskList(sch);
	}
	public List<Risk> pagingRisk(RiskSch sch){
		if(sch.getSchKeyword()==null) sch.setSchKeyword("");
		// 1. 총페이지 수
				sch.setCount(dao.totCnt(sch));
				// 2. 현재페이지 번호(클릭한)
				if(sch.getCurPage()==0) {
					sch.setCurPage(1);
				}
				// 3. 한페이지에 보일 데이터 갯수
				//   - 초기화면 현재 페이지 번호 0 ==> default설정
				if(sch.getPageSize()==0) {
					sch.setPageSize(5);
				}
				// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
				//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
				//    100건?  100/5 ==> 20 page 필요
				//    101건?  101/5 ==> 21 page 필요(올림처리 필요)
				sch.setPageCount(
						(int)Math.ceil(
						sch.getCount()/(double)sch.getPageSize())
						);
				// 블럭의 [이후]에 대한 예외 처리..
				if(sch.getCurPage()>sch.getPageCount()) {
					sch.setCurPage(sch.getPageCount());
				}			
				
				// 5. 마지막 번호
				sch.setEnd(sch.getCurPage()*sch.getPageSize());
				sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
				// 6. 블럭처리
				//    1) 블럭 크기 지정
				sch.setBlockSize(5);
				//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
				int blocknum = (int)Math.ceil(sch.getCurPage()/
							(double)sch.getBlockSize());
				//    3) 마지막 블럭
				int endBlock = blocknum*sch.getBlockSize();
				if(endBlock>sch.getPageCount()) {
					endBlock = sch.getPageCount();
				}
				sch.setEndBlock(endBlock);
				//	  4) 시작 블럭
		        if(blocknum!=0)
		        sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
				// 
				
				
				return dao.pagingRisk(sch);
	}
	public Risk getRisk(int riskno) {
		return dao.getRisk(riskno);
	}
	public void insertRisk(Risk ins) {
		dao.insertRisk(ins);
	}
	public void updateRisk(Risk upt) {
		if(upt.getSolno()==null) upt.setSolno("");
		dao.updateRisk(upt);
	}
	public void updateRisk2(Risk upt) {
		if(upt.getSolno()==null) upt.setSolno("");
		dao.updateRisk2(upt);
	}
	public void deleteRisk(Risk del) {
		dao.deleteRisk(del);
	}
	public Strategy getStrategy(int strategyno) {
		return dao.getStrategy(strategyno);
	}
	public void insertStrategy(Strategy ins) {
		dao.insertStrategy(ins);
	}
	public List<Strategy> pagingCare(StrategycareSch sch){
		// 1. 총페이지 수
		sch.setCount(dao.totCntCare(sch));
		// 2. 현재페이지 번호(클릭한)
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 3. 한페이지에 보일 데이터 갯수
		//   - 초기화면 현재 페이지 번호 0 ==> default설정
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
		//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
		//    100건?  100/5 ==> 20 page 필요
		//    101건?  101/5 ==> 21 page 필요(올림처리 필요)
		sch.setPageCount(
				(int)Math.ceil(
				sch.getCount()/(double)sch.getPageSize())
				);
		// 블럭의 [이후]에 대한 예외 처리..
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}			
		
		// 5. 마지막 번호
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		// 6. 블럭처리
		//    1) 블럭 크기 지정
		sch.setBlockSize(5);
		//	  2) 블럭 번호 지정 : 현재페이지번호/블럭의 크기 올림 처리
		int blocknum = (int)Math.ceil(sch.getCurPage()/
					(double)sch.getBlockSize());
		//    3) 마지막 블럭
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		//	  4) 시작 블럭
        if(blocknum!=0)
        sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.pagingCare(sch);
	}
	public void insertCare(Strategycare ins) {
		dao.insertCare(ins);	
	}
}

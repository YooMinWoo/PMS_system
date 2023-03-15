package superPms.service;

import java.security.SecureRandom;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import superPms.dao.SuperEmp_Dao;
import superPms.vo.DeptCode;
import superPms.vo.DeptSch;
import superPms.vo.PassMail;
import superPms.vo.SuperDept;
import superPms.vo.SuperEmpDept;
import superPms.vo.SuperEmpDeptSch;


@Service
public class SuperEmp_Service {
	@Autowired(required=false)
	private SuperEmp_Dao dao;
	@Autowired(required=false)
	private JavaMailSender sender;
	
	// 입사자 계정 생성시 비밀번호 메일로 발송
	public String sendMailNewEmp(PassMail email) {
		String resultMsg = "입사자에게 안내 이메일 발송 완료";
		
		// 메일 데이터를 전송을 위한 객체 생성
		MimeMessage mmsg = sender.createMimeMessage();
		try {
			// 1) 제목
			mmsg.setSubject("[ PMS시스템 비밀번호 발송 ]");
			// 2) 수신자
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getId()));
			// 3) 내용
			mmsg.setText(email.getEname()+" 사원의 입사를 축하드립니다 ! \n"+"귀하의 PMS시스템 비밀번호는 "+email.getPass()+" 입니다. \n 마이페이지에서 비밀번호를 변경하여 사용할 수 있습니다.");
			
			// 4) 발송처리
			sender.send(mmsg);
			
			// 입사자 정보를 db에 저장
			// #{id}, #{pass}, #{ename}, #{cell}, 4, #{deptid}, sysdate, '사원'
			SuperEmpDept s = new SuperEmpDept();
			s.setId(email.getId());
			s.setPass(email.getPass());
			s.setEname(email.getEname());
			s.setCell(email.getCell());
			s.setDeptid(email.getDeptid());
			dao.insertEmp(s);
			
		} catch (MessagingException e) {
			System.out.println("메시지 전송 에러:"+e.getMessage());
			resultMsg="메시지 전송 에러:"+e.getMessage();
		}catch(Exception e) {
			System.out.println("기타 에러:"+e.getMessage());
			resultMsg="기타 에러:"+e.getMessage();
		}
		
		return resultMsg;
	}
	
	// 임시 비밀번호 발급
	public String sendMail(PassMail email) {
		String resultMsg = "임시 비밀번호가 이메일로 발송되었습니다.";
		// 랜덤 비밀번호 길이 지정
		int passLen = 15;
		// 
		SecureRandom random = new SecureRandom();
	    String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	    StringBuilder password = new StringBuilder(passLen);
	    
	    for (int i = 0; i < passLen; i++) {
	      int index = random.nextInt(letters.length());
	      password.append(letters.charAt(index));
	    }
		
		// 메일 데이터를 전송을 위한 객체 생성
		MimeMessage mmsg = sender.createMimeMessage();
		try {
			// 1) 제목
			mmsg.setSubject("[ PMS시스템 임시 비밀번호 발급 ]");
			// 2) 수신자
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));
			// 3) 내용
			mmsg.setText("임시 비밀번호는 "+password.toString()+" 입니다. \n 해당 비밀번호로 다시 로그인하여 비밀번호를 변경하여 사용하세요");
			
			// 4) 발송처리
			sender.send(mmsg);
			
			// 임시 비밀번호를 db에 저장
			SuperEmpDept s = new SuperEmpDept();
			s.setId(email.getReceiver());
			s.setNewPass(password.toString());
			dao.updateMyInfo(s);
			
		} catch (MessagingException e) {
			System.out.println("메시지 전송 에러:"+e.getMessage());
			resultMsg="메시지 전송 에러:"+e.getMessage();
		}catch(Exception e) {
			System.out.println("기타 에러:"+e.getMessage());
			resultMsg="기타 에러:"+e.getMessage();
		}
		
		
		return resultMsg;
	}
	
	public List<SuperEmpDept> getEmpList(SuperEmpDept sch){
		if(sch.getSename()==null) sch.setSename("");
	    if(sch.getDname()==null) sch.setDname("");
	    if(sch.getJob()==null) sch.setJob("");
	    return dao.getEmpList(sch);
	}
	public SuperEmpDept idChk(String id) {
		return dao.idChk(id);
	}
	public SuperEmpDept cellChk(String cell) {
		return dao.cellChk(cell);
	}
	public void insertEmp(SuperEmpDept ins) {
		dao.insertEmp(ins);
	}
	public void deleteEmp(String id) {
		dao.deleteEmp(id);
	}
	public List<DeptCode> getParentDeptComb(){
		return dao.getParentDeptComb();
	}
	public SuperEmpDept getAuthSetting(String id) {
		return dao.getAuthSetting(id);
	}
	public List<String> getJobCom(){
		return dao.getJobCom();
	}
	public List<String> getAuthCom(){
		return dao.getAuthCom();
	}
	public void uptEmp(SuperEmpDept upt) {
		dao.uptEmp(upt);
	}
	public SuperEmpDept login(SuperEmpDept se) {
		return dao.login(se);
	}
	public void updateMyInfo(SuperEmpDept upt) {
		dao.updateMyInfo(upt);
	}
	public List<SuperEmpDept> getEmpListPage(SuperEmpDeptSch sch){
		if(sch.getSename()==null) sch.setSename("");
	    if(sch.getDname()==null) sch.setDname("");
	    if(sch.getJob()==null) sch.setJob("");
		// 1. 총페이지 수
		sch.setCount(dao.empTot(sch));
		// 2. 현재페이지 번호(클릭한)
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 3. 한페이지에 보일 데이터 갯수
		//   - 초기화면 현재 페이지 번호 0 ==> default설정
		if(sch.getPageSize()==0) {
			sch.setPageSize(15);
		}
		// 4. 총페이지 수.(전체데이터/한페이지에 보일 데이터 건수)
		//    한번에 보일 데이터 건수 5건일 때, 총건수11 ==> 3페이지
		//    100건?  100/5 ==> 20 page 필요
		//    101건?  101/5 ==> 21 page 필요(올림처리 필요)
		sch.setPageCount(
			(int)Math.ceil(sch.getCount()/(double)sch.getPageSize()));
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
		int blocknum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		//    3) 마지막 블럭
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}

		sch.setEndBlock(endBlock);
		//	  4) 시작 블럭
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		
		return dao.getEmpListPage(sch);
	}

}

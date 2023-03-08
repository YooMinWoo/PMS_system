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
import superPms.vo.PassMail;
import superPms.vo.SuperEmpDept;


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

}

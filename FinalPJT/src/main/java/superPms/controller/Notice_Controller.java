package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import superPms.service.Notice_Service;
import superPms.service.SuperDept_Service;
import superPms.vo.Notice;
import superPms.vo.NoticeRep;
import superPms.vo.NoticeRepSch;
import superPms.vo.NoticeSch;

@Controller
public class Notice_Controller {
	// http://49.238.187.241:7080/FinalPJT/PMSLogin.do	==> 서버컴 실행
//	http://localhost:2030/FinalPJT/goNotice.do		==> user
	// http://localhost:2030/FinalPJT/PMSLogin.do	==> login
	@Autowired(required = false)
	private Notice_Service service;
	
	@Autowired(required = false)
	private SuperDept_Service service2;
	
	@RequestMapping("/goNotice.do")
	public String goNotice(NoticeSch sch, Model d) {
		d.addAttribute("depts",service2.getParentDeptComb());
		d.addAttribute("noticeList",service.noticeList(sch));
		return "WEB-INF\\minwooView\\notice.jsp";
	}
	
//	http://localhost:2030/FinalPJT/goCreateNotice.do
	@RequestMapping("/goCreateNotice.do")
	public String goCreateNotice(Model d) {
		d.addAttribute("depts",service2.getParentDeptComb());
		return "WEB-INF\\minwooView\\notice_create.jsp";
	}
	
	@RequestMapping("/goNoticeDetail.do")
	public String goNoticeDetail(NoticeRepSch sch, Model d) {
		service.plusCnt(sch);
		d.addAttribute("depts",service2.getParentDeptComb());
		d.addAttribute("noticeDetail",service.noticeDetail(sch));
		d.addAttribute("noticeRep",service.noticeRepList(sch));
		return "WEB-INF\\minwooView\\notice_detail.jsp";
	}
	
	
//	http://localhost:2030/FinalPJT/goModal.do		==> modal창
	@RequestMapping("/goModal.do")
	public String goModal() {
		return "WEB-INF\\minwooView\\modal.jsp";
	}
	
	@PostMapping("/insertFN.do")
	public String insertFN(Notice sch) {
		service.insertFN(sch);
		return "redirect:/goNotice.do";
	}
	
	@PostMapping("uptNotice.do")
	public String uptNotice(Notice sch) {
		service.uptNotice(sch);
		return "redirect:/goNotice.do";
	}
	
	@RequestMapping("/delNotice.do")
	public String delNotice(@RequestParam("noticeno") int[] nos) {
		service.delNotice(nos);
		return "redirect:/goNotice.do";
	}
	
	// 다운로드 컨트롤러
	@GetMapping("/download.do")
	public String download (@RequestParam("fname") String fname,
							@RequestParam("path") String path, Model d) {
		d.addAttribute("downloadFile", fname);
		d.addAttribute("path", path);
		return "downloadViewer";
	}
	
	@PostMapping("/insertNoticeRep.do")
	public String insertNoticeRep(NoticeRep ins) {
		service.insertNoticeRep(ins);
		return "redirect:/goNoticeDetail.do?noticeno="+ins.getNoticeno();
	}
	@RequestMapping("/deleteNoticeRep.do")
	public String deleteNoticeRep(NoticeRep ins) {
		service.deleteNoticeRep(ins);
		return "redirect:/goNoticeDetail.do?noticeno="+ins.getNoticeno();
	}
	@RequestMapping("/updateNoticeRep.do")
	public String updateNoticeRep(NoticeRep ins) {
		service.updateNoticeRep(ins);
		return "redirect:/goNoticeDetail.do?noticeno="+ins.getNoticeno();
	}
	
}

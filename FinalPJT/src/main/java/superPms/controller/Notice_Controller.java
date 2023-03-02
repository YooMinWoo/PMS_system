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
import superPms.vo.NoticeSch;

@Controller
public class Notice_Controller {
//	http://localhost:2030/FinalPJT/goNotice.do		==> user
//	http://localhost:2030/FinalPJT/goNoticePM.do	==> admin
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
	public String goCreateNotice() {
		return "WEB-INF\\minwooView\\notice_create.jsp";
	}
	
	@RequestMapping("/goNoticeDetail.do")
	public String goNoticeDetail(Notice sch, Model d) {
		service.plusCnt(sch);
		d.addAttribute("noticeDetail",service.noticeDetail(sch));
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
	
	
}

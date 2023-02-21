package superPms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Notice_Controller {
//	http://localhost:2030/FinalPJT/goNotice.do		==> user
//	http://localhost:2030/FinalPJT/goNoticePM.do	==> admin
	@RequestMapping("/goNotice.do")
	public String goNotice() {
		return "WEB-INF\\minwooView\\notice.jsp";
	}
	
	@RequestMapping("/goNoticePM.do")
	public String goNoticePM() {
		return "WEB-INF\\minwooView\\notice_pm.jsp";
	}
	
//	http://localhost:2030/FinalPJT/goCreateNotice.do
	@RequestMapping("/goCreateNotice.do")
	public String goCreateNotice() {
		return "WEB-INF\\minwooView\\notice_create_pm.jsp";
	}
	
	@RequestMapping("/goNoticeDetail.do")
	public String goNoticeDetail() {
		return "WEB-INF\\minwooView\\notice_detail.jsp";
	}
	
	@RequestMapping("/goNoticeDetailPM.do")
	public String goNoticeDetailPM() {
		return "WEB-INF\\minwooView\\notice_detail_pm.jsp";
	}
	
	
//	http://localhost:2030/FinalPJT/goModal.do		==> modal창
	@RequestMapping("/goModal.do")
	public String goModal() {
		return "WEB-INF\\minwooView\\modal.jsp";
	}
}

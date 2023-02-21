package superPms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Notice_Controller {
//	http://localhost:2030/FinalPJT/goNoticePM.do
	@RequestMapping("/goNotice.do")
	public String goNotice() {
		return "WEB-INF\\ymwView\\notice.jsp";
	}
	
	@RequestMapping("/goNoticePM.do")
	public String goNoticePM() {
		return "WEB-INF\\ymwView\\notice_pm.jsp";
	}
	
//	http://localhost:2030/FinalPJT/goCreateNotice.do
	@RequestMapping("/goCreateNotice.do")
	public String goCreateNotice() {
		return "WEB-INF\\ymwView\\notice_create_pm.jsp";
	}
	
	@RequestMapping("/goNoticeDetail.do")
	public String goNoticeDetail() {
		return "WEB-INF\\ymwView\\notice_detail.jsp";
	}
	
	@RequestMapping("/goNoticeDetailPM.do")
	public String goNoticeDetailPM() {
		return "WEB-INF\\ymwView\\notice_detail_pm.jsp";
	}
}

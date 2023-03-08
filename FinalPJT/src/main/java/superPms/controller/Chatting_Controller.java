package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.ChatHandler;


@Controller
public class Chatting_Controller {
	@Autowired
	private ChatHandler chHandl;
	// http://localhost:2030/FinalPJT/chatting.do
	@RequestMapping("chatting.do")
	public String chatting(Model d) {
		// a07_chattingForm.jsp
		return "WEB-INF\\minwooView\\chatting.jsp";
	}
	
	// /chGroup.do
	@GetMapping("chGroup.do")
	public String chGroup(Model d) {
		d.addAttribute("group", chHandl.getIdx());
		return "pageJsonReport";
	}
}

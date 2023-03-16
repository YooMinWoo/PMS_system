package superPms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import superPms.service.Solution_Service;

@Controller
public class Solution_Controller {
	@Autowired(required=false)
	private Solution_Service service;
}

package controller.service;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Serivce;
import controller.common.SuperClass;
import dao.ServiceDao;

@Controller	
public class ServiceController extends SuperClass{
	private final String command = "/service.sr" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.pr" ;
	
@Autowired
@Qualifier("sdao")	
private ServiceDao dao ;


	public ServiceController() {
		// 변경 해야함
		super("personalservice", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "mid" ,required = false) String writer,
			HttpSession session) {
		Member swriter =(Member) session.getAttribute("loginfo");
		System.out.println(swriter.getMid());
		System.out.println("swriter알아보기");
		
		
		List<Serivce> bean  = dao.SelectServicelist(swriter.getMid());
		
		mav.addObject("slist", bean);
		
		
		this.mav.setViewName(super.getpage);
		
		return this.mav;
	}
	
	
}
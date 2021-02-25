package controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;

@Controller
public class MAddressController extends SuperClass{
	private final String command = "/address.ad" ; // 요청 커맨드(변경 요망)
	private final String redirect = "redirect:/xxx.me" ; // 리다이렉션(변경 요망)
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("adao") // (변경 요망)
	private AddressDao adao ;// (변경 요망)
	
	public MAddressController() {
		// (변경 요망)
		super("address", null); // super(getpage, postpage)  
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			HttpServletRequest request ,
			HttpSession session) {
		
		Member loginfo = (Member)session.getAttribute("loginfo"); 
		System.out.println("id : "+loginfo.getMid());
		
		//가져올 정보들의 다리역할
		Member userInfo = adao.SelectDataList(loginfo);
		mav.addObject("lists", userInfo);
		
		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost() {
		this.mav.setViewName(super.postpage); 
		return this.mav ;
	}
}
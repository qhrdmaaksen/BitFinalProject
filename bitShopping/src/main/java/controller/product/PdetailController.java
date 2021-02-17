package controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class PdetailController extends SuperClass{
	private final String command = "/aaa.me" ; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.co" ; // 리 다이렉션 // 변경 해야함
	
	//View에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ;
	
	
	@Autowired
	@Qualifier("mdao")// 변경 해야함
	private MemberDao mdao ;
	
	public PdetailController() {
		// 변경 해야함
		super("null", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(){		
		this.mav.setViewName(super.getpage); // 어디로 갈 것인가.
		
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(){
		
		return this.mav ;
	}
}

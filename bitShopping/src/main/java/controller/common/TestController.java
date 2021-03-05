package controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CompositeDao;

@Controller
public class TestController extends SuperClass{
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cdao") 
	private CompositeDao cdao ;
	
	public TestController() {
		// (변경 요망)
		super("test", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/test.cu")
	public ModelAndView doGet(){
		System.out.println("doget 메소드 시작");

		this.mav.setViewName(super.getpage);
		
		return this.mav ;
	}
	

}
package controller.mypayments;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import controller.common.SuperClass;

@Controller
public class TestController extends SuperClass{
	
	private final String command = "/test.pm" ; 
	private ModelAndView mav = null ;
	private String redirect = "" ;
	
	@GetMapping(command)
	public ModelAndView gotoPage() {
		ModelAndView mv = new ModelAndView("test");		
		return mv;
	}

}

package controller.mypayments;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.MypaymentDao;

@Controller
public class MypaymentsController extends SuperClass {
	private final String command ="/payment.pm";
	private String redirect = "redirect:/main.cu";
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("pmdao")
	private MypaymentDao pmdao;
	public MypaymentsController() {
		
		super("mypayments","null");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage); // 어디로 갈 것인가
		
		return this.mav;
	}

}

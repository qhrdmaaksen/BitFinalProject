package controller.mypayments;



import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Address;
import controller.common.SuperClass;

public class PaymentShippingController extends SuperClass {
	private final String command = "";
	private String redirect = "redirect/";
	private ModelAndView mav = null;
	
	@PostMapping(command)
	public ModelAndView doPost(
			HttpSession session,
			) {
		
		Address bean = new Address();
		
		
		
		return this.mav;
	}
	

}

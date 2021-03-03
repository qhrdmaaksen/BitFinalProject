package controller.mypayments;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;

@Controller
public class PaymentProgressController extends SuperClass {
		private final String command = "/payprogress.pm";
		private String redirect = "";
		private ModelAndView mav= null;
		
		/*
		 * @GetMapping(command) public ModelAndView doPost( HttpServletRequest request,
		 * HttpSession session) {
		 * 
		 * Member member = (Member) session.getAttribute("loginfo"); String jsonString =
		 * request.getParameter("productLists"); JSONTokener tokener = new
		 * JSONTokener(jsonString);
		 * 
		 * 
		 * 
		 * 
		 * return mav;
		 * 
		 * }
		 * 
		 */
		
	@GetMapping("/virtualaccount.pm")
	public ModelAndView gotoPage() {
		ModelAndView mv = new ModelAndView("virtualaccount");		
		return mv;
	}
}

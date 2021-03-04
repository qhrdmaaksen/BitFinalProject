package controller.mypayments;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;

@Controller
public class ShopListController extends SuperClass{
	private final String command = "/shop.li" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.pr" ;
	
	public ShopListController() {
		// 변경 해야함
		super("shoplist", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		
		
		this.mav.setViewName(super.getpage);
		
		return this.mav;
	}
	
	
}
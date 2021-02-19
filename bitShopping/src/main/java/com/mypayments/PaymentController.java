package com.mypayments;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;

@Controller
public class PaymentController extends SuperClass {
	private final String command ="/payment.pm";
	private String redirect = "redirect:/main.cu";
	
	private ModelAndView mav = null;
	
	@Autowired
	
	public PaymentController() {
		
		super("mypayments","null");
		this.mav = new ModelAndView();
	}

}

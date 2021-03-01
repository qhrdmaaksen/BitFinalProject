package controller.mypayments;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Address;
import controller.common.SuperClass;
import controller.member.AddressDao;

public class PaymentShippingController extends SuperClass {
	private final String command = "";
	private String redirect = "redirect/";
	private ModelAndView mav = null;

	@Autowired
	@Qualifier("adao")
	private AddressDao adao;

	public PaymentShippingController() {
		super("mypayments", "null");
		this.mav = new ModelAndView();
	}

	@ModelAttribute("address")
	public Address some() {
		return new Address();
	}

	@PostMapping(command)
	public ModelAndView doPost(@ModelAttribute Address address) {

		this.adao.InsertData(address);

		this.mav.setViewName(this.redirect);

		return this.mav;

	}
}

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
		
		//경희 
		Address bean = new Address();
		bean.setAddress1("sample4_roadAddress");
		bean.setAddress2("sample4_jibunAddress");
		bean.setId("id");
		bean.setName("name");
		bean.setPhone("phone");
		bean.setShippingname("shippingname");
		
		AddressDao adao = new AddressDao();
		int cnt = -999;
		cnt = adao.InsertData(bean);
		
		////////////////////////////////////////////////////////
		

		this.adao.InsertData(address);

		this.mav.setViewName(this.redirect);

		return this.mav;

//	
//	@PostMapping(command)
//	public ModelAndView doPost(
//			HttpSession session,
//			) {
//		
//		Address bean = new Address();
//		
//		
//		
//		return this.mav;
//	}
//	


	}
}

package controller.member;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;

@Controller
public class MShippingUpdateController extends SuperClass{
	private final String command = "/adress.ad" ;
	
	@Autowired//의존 주입
	@Qualifier("adao")//component "adao"지정
	private AddressDao adao ; 
	
	ModelAndView mav = null ; 
	
	public MShippingUpdateController() {
		super("address" , null) ;
		this.mav = new ModelAndView();
	}
	
	@ModelAttribute("member")
	public Member some() {
		return new Member();
	}
	@GetMapping(command)
	public ModelAndView doGet(
			
		@RequestParam(value = "mid" , required = true) String mid) {
		Member member = this.adao.SelectDataByPk(mid);
		
		System.out.println("shippingupdate member info : " + member.toString());
		
		return this.mav;
	}
	@PostMapping(command)
	public ModelAndView doPost(
		@ModelAttribute("member") @Valid Member xxx , 
		BindingResult error) {
		
		if (error.hasErrors()) {
			
			System.out.println("유효성 문제가 발생했습니다.");
			System.out.println(error.toString());
			this.mav.setViewName(super.getpage);
			
		} else {
			System.out.println("유효성 검사 문제가 없습니다.");
			this.adao.ShippingUpdataData(xxx) ;
			this.mav.setViewName(super.getpage);
		}
		return this.mav;
	}
}

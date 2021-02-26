package controller.productreviews;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Productreviews;
import controller.common.SuperClass;
import dao.ProductreviewsDao;

@Controller
public class PrrInsertController extends SuperClass {
	private final String command ="/insert.prr";
	private ModelAndView mav = null;
	private String redirect = "redirect:/insert.prr";
	
	@ModelAttribute("productreviews")
	public Productreviews myproductreviews() {
		System.out.println("@ModelAttribute(\"productreviews\")");
		return new Productreviews();
	}
	
	@Autowired
	@Qualifier("prrdao")
	private ProductreviewsDao prrdao;
	
	public PrrInsertController(){
		super("prrInsertForm", "prrList");
		this.mav = new ModelAndView();
		
	}
	
	@GetMapping(command)
	public ModelAndView doGet() {
		this.mav.setViewName(super.getpage);
		System.out.println("doGet 메소드");
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
		@ModelAttribute("productreviews") @Valid Productreviews bean,
		BindingResult abcd) {
		
		if (abcd.hasErrors()) {
			System.out.println("유효성 검사에 문제 있음");
			System.out.println(abcd);
			this.mav.addObject("bean", bean);
			this.mav.setViewName(this.redirect);
		} else {
			System.out.println("유효성 검사에 문제 없음");
			int cnt = -999999;
			//Bean 객체에 해당 게시물을 추가 
			cnt = prrdao.InsertData(bean);
			
			//request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 준다
			this.mav.setViewName(this.redirect);
		}
		return this.mav;
	}

}

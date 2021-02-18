package controller.productreviews;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import bean.Productreviews;
import controller.common.SuperClass;
import dao.ProductreviewsDao;

@Controller
public class PrInsertController extends SuperClass {
	private final String command ="/insert.prr";
	private ModelAndView mav = null;
	private String redirect = "redirect:/list.prr";
	
	@ModelAttribute("productreviews")
	public Productreviews myproductreviews() {
		System.out.println("@ModelAttribute(\"productreviews\")");
		return new Productreviews();
		
	@Autowired
	@Qualifier("prrdao")
	private ProductreviewsDao prrdao;
	
	
		
		
	}

}

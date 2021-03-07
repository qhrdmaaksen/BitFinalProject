package controller.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Product;
import controller.common.SuperClass;
import dao.productCategoryDao;

@Controller
public class productCategoryController extends SuperClass{
	
	
	@Autowired
	@Qualifier("categoryDao")
	public productCategoryDao categoryDao ;
	
	private ModelAndView mav = null ; 
	
	public productCategoryController() {
		
		super("common","");
		
		this.mav = new ModelAndView() ; 
	}
	@GetMapping("/common.pr")
	public ModelAndView doGet(@RequestParam HashMap<String, Object> paramMap) {//단일 파라미터 전달받을곳
		if(paramMap.get("keyword2") == null) {//키워드2가없다면 
			paramMap.put("keyword2", "");//키워드2는 공백처리
		}
		System.out.println(paramMap.get("keyword".toString()));

		List<Product> resultList = categoryDao.SelectDataList(paramMap);
		System.out.println("resultList : " + resultList);
		
		this.mav.addObject("lists" , resultList);

		
		this.mav.setViewName("plist");
		
		return this.mav;
	}
}

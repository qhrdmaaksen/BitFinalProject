package controller.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Product;
import dao.CompositeDao;
import utility.FlowParameters;

@Controller
public class MainSearchController extends SuperClass{
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cdao") 
	private CompositeDao cdao ;
	
	public MainSearchController() {
		
		super("mainsearch", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/mainsearch.cu")
	public ModelAndView doGet(
			@RequestParam(value = "keyword", required = true) String keyword
			){
		System.out.println("doget 메소드 시작");
		//System.out.println("keyword :" + keyword );
		
		List<Product> lists1 = cdao.SelectDataList1(keyword);
		//System.out.println(lists1.size());
		this.mav.addObject("lists1", lists1);
		this.mav.setViewName(super.getpage);
		
		return this.mav ;
	}
	

}
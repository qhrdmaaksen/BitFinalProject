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
import bean.TOP50;
import dao.CompositeDao;
import utility.FlowParameters;

@Controller
public class TOP50Controller extends SuperClass{
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cdao") 
	private CompositeDao cdao ;
	
	public TOP50Controller() {
		super("top50", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/top50.cu")
	public ModelAndView doGet(){
		System.out.println("doget 메소드 시작");
		
		List<TOP50> lists4 = cdao.SelectDataList4();
		
		System.out.println(lists4.size());
		
		this.mav.addObject("lists4", lists4);
		this.mav.setViewName(super.getpage);
		
		return this.mav ;
	}
	

}
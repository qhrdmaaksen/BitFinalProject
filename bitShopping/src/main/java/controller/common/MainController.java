package controller.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Product;
import dao.CompositeDao;
import utility.FlowParameters;

@Controller
public class MainController extends SuperClass{
	
	String mode1 = "과일"; // 추후 수정이 용이하도록 이곳에 작성 해 주었습니다.
	String mode2 = "채소";
	String mode3 = "간식";
	String mode4 = "베이커리";
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("cdao") 
	private CompositeDao cdao ;
	
	public MainController() {
		// (변경 요망)
		super("main", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/main.cu")
	public ModelAndView doGet(){
		System.out.println("doget 메소드 시작");
		List<Product> lists2 = cdao.SelectDataList2(mode1, mode2);
		List<Product> lists3 = cdao.SelectDataList3(mode3, mode4);
		List<Product> lists5 = cdao.SelectDataList5();
		
		//System.out.println(lists2.size());
		
		this.mav.addObject("lists2", lists2);
		this.mav.addObject("lists3", lists3);
		this.mav.addObject("lists5", lists5);
		this.mav.setViewName(super.getpage);
		
		return this.mav ;
	}
	

}
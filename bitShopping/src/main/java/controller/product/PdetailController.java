package controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Product;
import controller.common.SuperClass;
import dao.ProductDao;

@Controller
public class PdetailController extends SuperClass{
	private final String command = "/pdetail.pr" ; // 요청 커맨드
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 
	
	//View에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ;
	
	
	@Autowired
	@Qualifier("pdao")
	private ProductDao dao ;
	
	public PdetailController() {
		// 변경 해야함
		super("pdetail", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "pno", required = true) int pno
			){
		Product bean  = dao.SelectDataByPk( pno );
		
		if( bean != null){ //상세 보기로 이동			 
			mav.addObject("bean", bean);
			this.mav.setViewName(super.getpage);	
		}else{
			this.mav.setViewName(this.redirect);		 
		}
		
		return this.mav ;
	}
	
	/*
	 * @PostMapping(command) public ModelAndView doPost(){
	 * 
	 * return this.mav ; }
	 */
	
	
}

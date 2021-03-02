package controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Product;
import bean.Productreviews;
import controller.common.SuperClass;
import dao.ProductDao;
import dao.ProductreviewsDao;

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
		mav.addObject("pno", pno);
		
		List<Productreviews> lists = dao.SelectDataList(pno);
				
		
		if( bean != null){ //상세 보기로 이동			 
			mav.addObject("bean", bean);
			
			String mode1 = bean.getPcategory(); // 같은 카테고리 상품 추천
			List<Product> lists1 = dao.SelectDataList1(mode1);
			//System.out.println("리스트는 몇 개? : " + lists1.size());
			mav.addObject("lists", lists);
			mav.addObject("lists1", lists1);
			this.mav.setViewName(super.getpage);	
		}else{
			this.mav.setViewName(this.redirect);		 
		}
		
		return this.mav ;
	}
	
	
}

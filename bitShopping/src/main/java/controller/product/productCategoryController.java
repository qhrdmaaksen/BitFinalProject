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
	
	String modeFruit = "과일" ;
	String modeVegetable = "채소" ;
	String modeRice = "쌀" ;
	String modeSeafood = "해산" ;
	String modeMeat = "정육" ;
	String modeBakery = "베이커리" ;
	String modeSnack = "제과" ;
	String modeEgg = "계란" ;
	String modeCheese = "치즈" ;
	String modeSalad = "샐러드" ;
	String modeSimplefood = "간편식" ;
	
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
//		List<Product> FVlists = categoryDao.SelectDataListFV(modeFruit , modeVegetable); 
//		List<Product> Rlists = categoryDao.SelectDataListR(modeRice); 
//		List<Product> SMlists = categoryDao.SelectDataListSM(modeSeafood , modeMeat); 
//		List<Product> BSlists = categoryDao.SelectDataListBS(modeBakery, modeSnack); 
//		List<Product> EClists = categoryDao.SelectDataListEC(modeEgg, modeCheese); 
//		List<Product> SSlists = categoryDao.SelectDataListSS(modeSalad, modeSimplefood); 
		List<Product> resultList = categoryDao.SelectDataList(paramMap);
		System.out.println("resultList : " + resultList);
		
		this.mav.addObject("lists" , resultList);
//		this.mav.addObject("FVlists", FVlists);
//		this.mav.addObject("Rlists", Rlists);
//		this.mav.addObject("SMlists", SMlists);
//		this.mav.addObject("BSlists", BSlists);
//		this.mav.addObject("EClists", EClists);
//		this.mav.addObject("SSlists", SSlists);
		
		this.mav.setViewName("plist");
		
		return this.mav;
	}
}

package controller.mall;

import javax.servlet.http.HttpSession;

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
import shopping.MyCartList;

@Controller
public class MallInsertController extends SuperClass{
	private final String command = "/insert.mall" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/list.pr" ;
	
	@Autowired
	@Qualifier("pdao")
	private ProductDao dao ;
	
	public MallInsertController() {
		super("plist", null);
		this.mav = new ModelAndView();
	}	
	
	
	@GetMapping(command)
	public ModelAndView doGet( // 어떤 페이지에서도 바로 장바구니에 넣을 수 있도록
			@RequestParam(value = "pno", required = true) int pno,
			@RequestParam(value = "pqty", required = true) int pqty,
			@RequestParam(value = "qty", required = true) int qty, 
			HttpSession session){
			// pqty : 재고, qty : 구매 수량
		if (pqty == 0) {
			pqty = dao.SelectDataByPk(pno).getPqty();
		}
		
		//System.out.println("pqty : "+ pqty);
		
		int pcnt = 0 ; // 장바구니에 담긴 상품 수량 체크
			if (pqty < qty) { //재고 수량 초과				
				String message = "재고 수량이 부족합니다." ;
				System.out.println(message);
				this.mav.addObject("errmsg", message);
				this.mav.setViewName("redirect:/list.pr");
			} else { // 판매에 문제 없슴
				
				//System.out.println("get으로 왔다");
				
				MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
				if (mycart == null) { // 카트가 없으면
					mycart = new MyCartList() ; // 매장 입구에서 카트 준비
				}
				mycart.AddOrder(pno, qty); // 카트에 담기
				pcnt = MyCartList.PCNT;
				System.out.println("pcnt : " + pcnt);
				session.setAttribute("pcnt", pcnt);
				session.setAttribute("mycart", mycart);
				//new list.mallController().doGet(request, response);
				this.mav.setViewName("redirect:/list.mall"); 
			}
		
		return this.mav ;
	}
	
	
	@PostMapping(command)
	public ModelAndView doPost(
			@RequestParam(value = "pno", required = true) int pno,
			@RequestParam(value = "pqty", required = true) int pqty,
			@RequestParam(value = "qty", required = true) int qty, 
			HttpSession session){
			// pqty : 재고, qty : 구매 수량
		int pcnt = 0 ; // 장바구니에 담긴 상품 수량 체크
			if (pqty < qty) { //재고 수량 초과				
				String message = "재고 수량이 부족합니다." ;
				System.out.println(message);
				this.mav.addObject("errmsg", message);
				this.mav.setViewName("redirect:/list.pr");
			} else { // 판매에 문제 없슴
				
				System.out.println("pno : " + pno);
				
				MyCartList mycart = (MyCartList)session.getAttribute("mycart") ;
				if (mycart == null) { // 카트가 없으면
					mycart = new MyCartList() ; // 매장 입구에서 카트 준비
				}
				mycart.AddOrder(pno, qty); // 카트에 담기
				
				pcnt = MyCartList.PCNT;
				System.out.println("pcnt : " + pcnt);
				session.setAttribute("pcnt", pcnt);
				session.setAttribute("mycart", mycart);
				//new list.mallController().doGet(request, response);
				this.mav.setViewName("redirect:/list.mall"); 
			}
		
		return this.mav ;
	}
	
}





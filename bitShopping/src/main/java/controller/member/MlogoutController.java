package controller.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Product;
import controller.common.SuperClass;
import controller.mall.MallListController;
import dao.MemberDao;
import dao.ProductDao;
import shopping.MyCartList;
import shopping.ShoppingInfo;

@Controller
public class MlogoutController extends SuperClass{
	private final String command = "/logout.me" ; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 // 변경 해야함
	
	//View에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao ;
	
	@Autowired
	@Qualifier("pdao")
	private ProductDao pdao ;
	
	public MlogoutController() {
		// 변경 해야함
		super("logout", null); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command) // 사용자가 로그아웃을 시도함
	public ModelAndView doGet(
			HttpSession session){
		
		//세션 공간에 장바구니의 wish list가 있다면, ShoppingInfos 테이블에 저장하는 루틴 코딩 해주세요.
		
		MyCartList mycart = (MyCartList)session.getAttribute("mycart");
		
		if (mycart != null) {
			Map<Integer, Integer> maplists = mycart.GetAllOrderLists();
			
			System.out.println("지금 로그아웃 중이시군요");
			System.out.println("장바구니 품목 갯수 : " + maplists.size());
			
			Member mem = (Member)session.getAttribute("loginfo");
			
			Set<Integer> keylist = maplists.keySet();
			
			List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
			
			//pnum은 상품 번호(기본 키)
			for(Integer pno : keylist) {
				//bean은 장바구니 내의 품목 한 개
				Product bean = this.pdao.SelectDataByPk(pno) ;
				
				ShoppingInfo shpInfo = new ShoppingInfo();
				
				shpInfo.setDiscount(MallListController.DISCOUNT);
				shpInfo.setMid(mem.getMid());
				shpInfo.setPimg(bean.getPimg1());
				shpInfo.setPrice(bean.getPrice());
				shpInfo.setProductcode(bean.getProductcode());
				shpInfo.setProductname(bean.getProductname());
				int qty = maplists.get(pno);
				shpInfo.setQty(qty); // 구매한 수량
				
				lists.add(shpInfo);
			}
			
			//차후 로그인 시 읽어오기 위하여 ShoppingInfos 테이블에 데이터를 추가합니다.
			mdao.InsertCartData(mem, lists);
		}
		
		// 세션영역의 모든 정보를 비움
		session.invalidate(); 
		
		this.mav.setViewName(this.redirect); // 어디로 갈 것인가.
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(){
		
		return this.mav ;
	}
	
	
}

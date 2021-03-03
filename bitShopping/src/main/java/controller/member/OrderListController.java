package controller.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Order;
import controller.common.SuperClass;
import dao.OrderDao;

@Controller
public class OrderListController extends SuperClass{
	private final String command = "/mypage.mp" ;
	private final String redirect = "redirect:/login.me";
	
	@Autowired
	@Qualifier("odao")
	private OrderDao odao ;
	
	ModelAndView mav = null ; 
	
	public OrderListController() {
		super("mypage" , null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
		HttpServletRequest request ,
		HttpSession session)	{ //request 저장소 생성 및 session info 가져올 session 생성해주기
		System.out.println("ordercontroller들어옴");
		
		Member loginfo = (Member)session.getAttribute("loginfo") ; 
		
		System.out.println("mid shoppingInfo : " + loginfo.getMid());//로그인한 회원 정보 
		
			List<Order> lists = odao.OrderList(loginfo.getMid()); 
			mav.addObject("lists", lists);
			
			if (lists.size() == 0) {
				session.setAttribute("message", "이전 쇼핑 내역이 존재하지 않습니다.");
				this.mav.setViewName(super.getpage);
			}
			
		return this.mav ;
	}
	@GetMapping("/calculate.mall")
	public ModelAndView doGet2(
			HttpSession session) {
		System.out.println("maplists : 내가 구매한 상품을의 번호와 수량에 대한 컬렉션");
		Map<Integer, Integer> maplists = odao.GetAllOrderLists();
		
		//mem : 계산을 수행하는 당사자 
		Member mem = (Member) session.getAttribute("loginfo");
		
		
		
		return this.mav ; 
	}
}

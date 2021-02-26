package controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.ShoppingInfo;
import controller.common.SuperClass;
import dao.OrderDao;
import shopping.MyCartList;

@Controller
public class OrderListController extends SuperClass{
	private final String command = "/order.od" ;
	
	@Autowired
	@Qualifier("odao")
	private OrderDao odao ;
	
	ModelAndView mav = null ; 
	
	public OrderListController() {
		super("order" , null);
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
		HttpServletRequest request ,
		HttpSession session)	{ //request 저장소 생성 및 session info 가져올 session 생성해주기
		
		ShoppingInfo loginfo = (ShoppingInfo)session.getAttribute("loginfo") ; 
		System.out.println("mid shoppingInfo : " + loginfo.getMid());//로그인한 회원 정보 
		
		List<ShoppingInfo> lists = odao.SelectDataList(loginfo);//로그인한 회원의 쇼핑정보 객체생성
		
		this.mav.setViewName(super.getpage);
		return this.mav ;
	}
}

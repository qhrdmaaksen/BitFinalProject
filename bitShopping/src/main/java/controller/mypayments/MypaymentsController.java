package controller.mypayments;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Product;
import controller.common.SuperClass;
import dao.ProductDao;
import shopping.MyCartList;
import shopping.ShoppingInfo;

@Controller
public class MypaymentsController extends SuperClass {
	private final String command = "/payment.pm";
	private String redirect = "redirect:/plist.pr";

	private ModelAndView mav = null;

	@Autowired

	@Qualifier("pdao")
	private ProductDao pdao;//

	public MypaymentsController() {

		super("mypayments", "plist");
		this.mav = new ModelAndView();

	}

	@RequestMapping(value = "/payment.pm", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView doPost(HttpSession session, HttpServletRequest request) throws ServletException, IOException {
		Member member = (Member) session.getAttribute("loginfo");
		
		/*  if(request.getParameter("directbuy").equals("1")){*/
		  
		  
		/*
		 * List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>(); ShoppingInfo order
		 * = new ShoppingInfo(); ProductDao pdao = new ProductDao(); Product product =
		 * pdao.SelectDataByPk(Integer.parseInt(request.getParameter("productcode")));
		 * 
		 * int productprice = (int)(product.getPrice()*0.8);
		 * 
		 * order.setPimg(product.getPimg1());
		 * order.setProductname(product.getProductname());
		 * order.setProductcode(product.getProductcode()); order.setPrice(productprice);
		 * order.setQty(Integer.parseInt(request.getParameter("qty")));
		 * System.out.println(" qty : " +
		 * Integer.parseInt(request.getParameter("qty"))); lists.add(order);
		 * 
		 * request.setAttribute("productLists", lists);
		 * request.setAttribute("totalcount", lists.size());
		 * request.setAttribute("totalprice", productprice *
		 * Integer.parseInt(request.getParameter("qty")));
		 * 
		 * 
		 * }else {
		 */
		 

		MyCartList mycart = (MyCartList) session.getAttribute("mycart");

		Map<Integer, Integer> maplists = mycart.GetAllOrderLists();
		Set<Integer> keylist = maplists.keySet();
		List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();

		int totalAmount = 0; // 총 판매 금액

		for (int pno : keylist) { // pno : 상품 번호 
			int qty = maplists.get(pno); // 구매 수량
//
//			ProductDao pdao = new ProductDao();
//			System.out.println(pno);
			// 상품 번호 cno에 대한 Bean 정보
			 Product bean = pdao.SelectDataByPk(pno);
			 System.out.println("확인요요2222");

			 
//			
			  int price = (int) (bean.getPrice() * 0.8); 	
			  int point = bean.getPrice();
//			  
			  totalAmount += qty * price;
//			  
			  ShoppingInfo shopinfo = new ShoppingInfo();
			

//			  shopinfo.setPimg(bean.getPimg1());
//			  shopinfo.setProductname(bean.getProductname());
//			  shopinfo.setProductcode(pno); shopinfo.setPrice(price);
//			  shopinfo.setQty(qty);
//			 
//
//			 lists.add(shopinfo); 
//
//			request.setAttribute("productLists", lists);
//			request.setAttribute("totalcount", lists.size());
//			request.setAttribute("totalprice", totalAmount);

		}
//
//		AddressDao addrdao = new AddressDao();
//		Address address = addrdao.SelectDataByPk2(member.getMid());
//		request.setAttribute("address", address);
//		request.setAttribute("addressList", addrdao.SelectAllAddress(member.getMid()));
//		super.doPost(request, response);
//		// response에 왜 빨간줄이 뜨나 ?
//
//		request.setAttribute("directbuy", request.getParameter("directbuy"));
//		super.GotoPage("mypayments.jsp");
//		return mav;
		
		this.mav.setViewName(super.getpage);
		System.out.println("doGet 메소드");
	
		return this.mav;

	}
}
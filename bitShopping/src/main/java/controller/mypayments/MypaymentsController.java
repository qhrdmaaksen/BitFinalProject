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

import bean.Address;
import bean.Member;
import bean.Product;
import controller.common.SuperClass;
import controller.member.AddressDao;
import dao.ProductDao;
import shopping.MyCartList;
import shopping.ShoppingInfo;

@Controller
public class MypaymentsController extends SuperClass {
	private final String command ="/payment.pm";
	private String redirect = "redirect:/plist.pr";
	
	private ModelAndView mav = null;
	
	
	  @Autowired
	  
	  @Qualifier("pdao") private ProductDao pdao;//
	  
	  public MypaymentsController() {
	  
	  super("mypayments","plist"); this.mav = new ModelAndView(); 
	  
	  }
	
	
	@RequestMapping(value = "/payment.pm" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView doPost(HttpSession session, HttpServletRequest request ) throws ServletException, IOException {
		
		if(request.getParameter("directbuy").equals("1")){
			
			
		
			List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
			ShoppingInfo order = new ShoppingInfo();
			ProductDao pdao = new ProductDao();
			Product product = pdao.SelectDataByPk(Integer.parseInt(request.getParameter("productcode")));
			
			int productprice = (int)(product.getPrice()*0.8);
			
			order.setPimg(product.getPimg1());
			order.setProductname(product.getProductname());
			order.setProductcode(product.getProductcode());
			order.setPrice(productprice);
			order.setQty(Integer.parseInt(request.getParameter("qty")));
			System.out.println(" qty : " + Integer.parseInt(request.getParameter("qty")));
			lists.add(order);
			
			request.setAttribute("productLists", lists);
			request.setAttribute("totalcount", lists.size());
			request.setAttribute("totalprice", productprice * Integer.parseInt(request.getParameter("qty")));
			
		  
		}else {
			
			MyCartList mycart = (MyCartList) session.getAttribute("mycart");
			
			Map<Integer, Integer> maplists = mycart.GetAllOrderLists();
			Set<Integer> keylist = maplists.keySet();
			List<ShoppingInfo> lists = new ArrayList<ShoppingInfo>();
			
			int totalAmount = 0; // 총 판매 금액 
			
			for (Integer productcode : keylist) { // productcode : 상품 번호 
				 Integer qty = maplists.get(productcode); // 구매 수량 
				 
				 ProductDao pdao = new ProductDao();
				 
				 //상품 번호 productcode에 대한 Bean 정보 
				 Product bean = pdao.SelectDataByPk(productcode);
				 
				 int productprice = (int)(bean.getPrice()*0.8);
				 int point = bean.getPrice();
				 
				 totalAmount += qty * productprice ;
				 
				 ShoppingInfo shopinfo = new ShoppingInfo();
				 
				 shopinfo.setPimg(bean.getPimg1());
				 shopinfo.setProductname(bean.getProductname());
				 shopinfo.setProductcode(productcode);
				 shopinfo.setPrice(productprice);
				 shopinfo.setQty(qty);
				 
				 lists.add(shopinfo);
				 
			}
			
			request.setAttribute("productLists", lists);
			request.setAttribute("totalcount", lists.size());
			request.setAttribute("totalprice", totalAmount);
		
		}
		
			AddressDao addrdao = new AddressDao();
			Address address = addrdao.SelectDataByPk(Member.getMid());
			request.setAttribute("address", address);
			request.setAttribute("addressList", addrdao.SelectAllAddress(Member.getMid()));
			super.doPost(request, response); // response에 왜 빨간줄이 뜨나 ? 
			
			request.setAttribute("directbuy", request.getParameter("directbuy"));
			super.GotoPage("mypayments.jsp");
			return mav;
			
	}

}

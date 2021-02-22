package controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.CheckBean;
import bean.Member;
import controller.common.SuperClass;
import dao.MemberDao;
import shopping.MyCartList;
import shopping.ShoppingInfo;

@Controller 
public class MloginController extends SuperClass{
	private final String command = "/login.me" ; // 요청 커맨드 
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 
	
	//View에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ;
	
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao ;
	
	@ModelAttribute("member")
	public Member some() {
		return new Member();
		
	}

	
	public  MloginController() {
		super("login", null); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}

	
	@GetMapping(command)
	public ModelAndView doGet(){		
		
	
		this.mav.setViewName(super.getpage); // 어디로 갈 것인가.
			
		return this.mav ;
	}
	
	
	@PostMapping(command) //로그인 페이제이서 로그인 버튼을 클릭함 
	public ModelAndView doPost(
			@RequestParam(value = "id" , required = false) String id ,
			@RequestParam(value = "password", required = false) String password,
			HttpSession session) {
			
			boolean isCheck = true ;
			
			if(id.length() <4 || id.length() > 10) {
				mav.addObject(super.PREFIX+"id", "아이디는 4자리 이상 10자리 이하이어야합니다");
				isCheck=false;

			}
			
			if(password.length() <4 || password.length() > 10) {
				mav.addObject(super.PREFIX+"password", "비밀번호는 4자리 이상 10자리 이하이어야합니다");
				isCheck=false;

			}
			
			if(isCheck == true) {
				Member member = new Member();
				member = mdao.SelectDataByPk(id);
				
				if(member == null) {
					String message = "아이디나 비밀번호를 확인해주세요";
					this.mav.addObject("errmsg", message);
					
					this.mav.setViewName(super.getpage);
				
				}else {
					
					session.setAttribute("loginfo", member);
					
					List<ShoppingInfo> lists = this.mdao.getShoppingInfo(member.getMid());
					
					if(lists.size() > 0 ) {
						MyCartList cart = (MyCartList)session.getAttribute("mycart");
						
							if(cart == null) {
								cart = new MyCartList();
								
							}
						
						for(ShoppingInfo info : lists) {
							
							cart.AddOrder(info.getProductcode(), info.getQty());
							
						}
						session.setAttribute("mycart", cart);
						
							
					}
					
					this.mav.setViewName(redirect);
					
				}
				
				
				
			}
			
			else { // 문제가 있으면 
				this.mav.addObject("id",id);
				this.mav.addObject("password",password);
				this.mav.setViewName(super.getpage);
			}
			
			return this.mav ;
	}
	
	
	
}













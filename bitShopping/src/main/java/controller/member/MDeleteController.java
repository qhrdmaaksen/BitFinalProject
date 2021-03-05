package controller.member;

import bean.Member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controller.common.SuperClass;
import dao.MemberDao;

@Controller
public class MDeleteController extends SuperClass{
	private final String command = "/delete.me" ; // 요청 커맨드(변경 요망)
	private final String redirect = "redirect:/login.me" ; // 리다이렉션(변경 요망)
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("mdao") // (변경 요망)
	private MemberDao mdao ;// (변경 요망)
	
	public MDeleteController() {
		// (변경 요망)
		super("login", null); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet( // mid 파라미터로 , 필수 , 타입은 String
			@RequestParam(value = "mid" , required = true) String mid ,
			HttpSession session) {
				

		Member bean = this.mdao.SelectDataByPk(mid) ;

		int cnt = -999999 ;
		cnt = this.mdao.DeleteData(bean) ;

		// 탈퇴하는 사람에 대한 세선 정보를 완전히 비움
		session.invalidate();

		this.mav.setViewName(super.getpage); //login 페이지로 이동
		return this.mav ;
	}
	
//	@PostMapping(command)
//	public ModelAndView doPost() {
//		this.mav.setViewName(super.postpage);
//		return this.mav ;
//	}
}
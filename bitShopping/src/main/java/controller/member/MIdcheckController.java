package controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;
import dao.MemberDao;

@Controller // 아이디 중복 체크
public class MIdcheckController extends SuperClass{
	private final String command = "/idcheck.me" ; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 // 변경 해야함
	
	//View에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ;
	
	
	@Autowired
	@Qualifier("mdao")// 변경 해야함
	private MemberDao mdao ;
	
	public MIdcheckController() {
		// 변경 해야함
		super("idCheck", "null"); // super(getpage, postpage)
		// 이 idCheck.jsp 파일이 존재하는지 확인
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command) // 파라미터 id를 이용하여 테이블에 존재하는지 파악합니다.
	public ModelAndView doGet(
			@RequestParam(value = "id", required = true) String id ){ //파라미터가 한두개씩 넘어올때는 이걸 쓰는게 좋다.	
		System.out.println("idcheck");
		
		Member bean = this.mdao.SelectDataByPk(id);
		//다오에 어떤 메소드가 어떤 역할을 하고 어떤 메소드가 필요한지 정리 하세요.
		
		
		//isCheck의 값이 true면 사용 가능한 아이디
		if (bean != null) { // 회원이 존재 함
			if(bean.getMid().equalsIgnoreCase("admin")) { // 관리자인 경우
				this.mav.addObject("message", id + " 은 <b>사용 불가능한</b> 아이디 입니다.<br><font color='red'><b>관리자</b></font>를 위한 아이디 입니다.") ;
				this.mav.addObject("isCheck", false) ;
			}else {
				this.mav.addObject("message", id + " 은(는) 이미 <font color='red'><b>사용중인</b></font> 아이디 입니다.") ;
				this.mav.addObject("isCheck", false) ;
			}
			
		} else { // 아이디 사용 가능
			this.mav.addObject("message", id + " 은(는) <font color='blue'><b>사용 가능한</b></font> 아이디 입니다.") ;
			this.mav.addObject("isCheck", true) ;
		}
		
		
		
		this.mav.setViewName(super.getpage); // 어디로 갈 것인가.
		return this.mav ;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(){
		
		return this.mav ;
	}
}

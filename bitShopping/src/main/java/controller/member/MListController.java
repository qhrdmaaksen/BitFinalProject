package controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import controller.common.SuperClass;
import dao.MemberDao;
import utility.FlowParameters;
import utility.Paging;

@Controller // 관리자가 회원들의 목록을 조회하는 컨트롤러 입니다.
public class MListController extends SuperClass{
	private final String command = "/list.me" ; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 // 변경 해야함
	
	//View에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ;
	
	
	@Autowired
	@Qualifier("mdao")// 변경 해야함
	private MemberDao mdao ;
	
	public MListController() {
		// 변경 해야함
		super("mlist", "null"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet( // 페이징 관련 파라미터들
			FlowParameters param ){
		int totalcount = this.mdao.SelectTotalCount(param.getMode(), param.getKeyword());
		System.out.println("totalcount : " + totalcount);
		
		System.out.println(param);
		
		int totalCount 
		= this.mdao.SelectTotalCount(param.getMode(), param.getKeyword()) ;
		
		Paging pageInfo = new Paging(
				param.getPageNumber(),
				param.getPageSize(),
				totalCount,
				null, // url
				param.getMode(),
				param.getKeyword() );
		
		List<Member> lists = this.mdao.SelectDataList(
									pageInfo.getOffset(),
									pageInfo.getLimit(),
									param.getMode(),
									param.getKeyword());
		
		// 스프링은 기본 값으로 request 영역에 바인딩 합니다.
		this.mav.addObject("lists", lists);
		this.mav.addObject("pageInfo", pageInfo);
		
		//jsp 파일에서 방금 넣었던 모드와 키워드의 상태를 보여주기 위하여 바인딩 합니다.
		this.mav.addObject("mode", param.getMode());
		this.mav.addObject("keyword", param.getKeyword());
		
		System.out.println(pageInfo.getPagingHtml());
		this.mav.setViewName(super.getpage); // 어디로 갈 것인가.
		
		return this.mav ;
	}
	

}

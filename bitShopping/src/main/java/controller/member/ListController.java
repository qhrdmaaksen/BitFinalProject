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
import utility.Paging;

@Controller // 관리자가 회원들의 목록을 조회하는 컨트롤러 입니다.
public class ListController extends SuperClass{
	private final String command = "/list.me" ; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 // 변경 해야함
	
	// 뷰에 넘겨줄 ModelAndView 객체
		private ModelAndView mav = null ; 
		
		@Autowired
		@Qualifier("mdao") // (변경 요망)
		private MemberDao mdao ;// (변경 요망)
		
		public ListController() {
			// (변경 요망)
			super("list", null); // super(getpage, postpage)  
			this.mav = new ModelAndView();
		}
		
		@GetMapping(command)
		public ModelAndView doGet(
			FlowParameters param) { // 페이징 관련 파라미터들
//			@RequestParam(value = "pageNumber", required = false) String pageNumber,
//			@RequestParam(value = "pageSize", required = false) String pageSize,
//			@RequestParam(value = "mode", required = false) String mode,
//			@RequestParam(value = "keyword", required = false) String keyword) {
			
			int totalCount 
				= this.mdao.SelectTotalCount(param.getMode(), param.getKeyword()) ;
			
			System.out.println("totalCount : " + totalCount);
			
			System.out.println("파라미터 정보를 위한 출력");
			System.out.println(param.toString()); 
			
			Paging pageInfo 
				= new Paging(
						param.getPageNumber(), 
						param.getPageSize(), 
						totalCount, 
						null, 
						param.getMode(), 
						param.getKeyword()) ; 
			
			List<Member> lists = this.mdao.SelectDataList(
									pageInfo.getOffset(), 
									pageInfo.getLimit(), 
									param.getMode(),
									param.getKeyword()) ;
			
			// 스프링은 기본 값으로 request 영역에 바인딩합니다.
			this.mav.addObject("lists", lists) ;
			this.mav.addObject("pageInfo", pageInfo) ;
			
			// jsp 파일에서 방금 넣었던 모드와 키워드의 상태를 보여 주기 위하여 바인딩합니다.
			this.mav.addObject("mode", param.getMode()) ;
			this.mav.addObject("keyword", param.getKeyword()) ;
			
			this.mav.setViewName(super.getpage); 
			return this.mav ;
		}
		
//		@PostMapping(command)
//		public ModelAndView doPost() {
//			this.mav.setViewName(super.postpage); 
//			return this.mav ;
//		}
	}
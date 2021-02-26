package controller.productreviews;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Productreviews;
import controller.common.SuperClass;
import dao.ProductreviewsDao;
import utility.FlowParameters;
import utility.Paging;

@Controller
public class PrrListController extends SuperClass{
	private final String command = "/list.prr";
	private ModelAndView mav = null;
	private String redirect = "redirect:/detail.pr";
	
	@Autowired
	@Qualifier("prrdao")
	
	private ProductreviewsDao prrdao;

	public PrrListController() {
		//getpage, postpage 
		super("prrList", "prrList");
		this.mav = new ModelAndView();
	}
	
	@RequestMapping(value = "/detail.pr" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView doGet(
			@RequestParam(value = "pno", required = true)
			HttpServletRequest request,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "pageSize" , required = false) String pageSize,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "keyword", required = false) String keyword) {
		
		//페이징과 필드 검색을 위한 파라미터를 우선 챙긴다.
		FlowParameters parameters 
			= new FlowParameters(pageNumber, pageSize, mode, keyword );
		
		//파라미터 확인을 위한 출력 
		System.out.println(this.getClass() + " : " + parameters.toString());
		
	
		
		int totalCount 
			= prrdao.SelectTotalCount(
								parameters.getMode(), 
								parameters.getKeyword());
		
		System.out.println("totalCount : "  + totalCount);
		
		String contextPath = request.getContextPath() + "/";
		String myurl = contextPath + this.command;
		
		Paging pageInfo = new Paging(
									parameters.getPageNumber(),
									parameters.getPageSize(),
									totalCount,
									myurl,
									parameters.getMode(),
									parameters.getKeyword());
		
		List<Productreviews> lists = prrdao.SelectDataList(
											pageInfo.getOffset(), 
											pageInfo.getLimit(), 
											parameters.getMode(),
											parameters.getKeyword());
		
		//바인딩 해야 할 목록 들 
		mav.addObject("lists", lists); // 게시물 목록 
		
		
		//페이징 관련 항목들 
		mav.addObject("pagingHtml", pageInfo.getPagingHtml());
		mav.addObject("pagingStaturs", pageInfo.getPagingStatus());
		
		//검색 필드의 상태 값 저장을 위한 항목들 
		mav.addObject("mode", parameters.getMode());
		mav.addObject("keyword", parameters.getKeyword());
		
		//상세 보기, 수정, 삭제, 답글 등의 링크에 사용될 parameter list 문자열 
		mav.addObject("parameters", parameters.toString());
		
		this.mav.setViewName(super.getpage);
		System.out.println("doGet 메소드");
	
		return this.mav;

	
	}
	
	

}

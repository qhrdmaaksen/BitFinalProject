package controller.productreviews;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	private String redirect = "redirect:/list.prr";
	
	@Autowired
	@Qualifier("prrdao")
	
	private ProductreviewsDao prrdao;

	public PrrListController() {
		//getpage, postpage 
		super("prrList", "prrList");
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			FlowParameters param) {

		
		int totalcount 
		= this.prrdao.SelectTotalCount(param.getMode(),param.getKeyword());
		System.out.println("totalcount : "  + totalcount);
		
		System.out.println(param);
		
		int totalCount 
		= this.prrdao.SelectTotalCount(param.getMode(), param.getKeyword());
		
		Paging pageInfo = new Paging(
				param.getPageNumber(),
				param.getPageSize(),
				totalCount,
				null,
				param.getMode(),
				param.getKeyword());
		
		List<Productreviews> lists = this.prrdao.SelectDataList(
											pageInfo.getOffset(), 
											pageInfo.getLimit(), 
											pageInfo.getMode(), 
											pageInfo.getKeyword());
		
		this.mav.addObject("lists", lists);
		this.mav.addObject("pageInfo", pageInfo);
		
		this.mav.addObject("mode", param.getMode());
		this.mav.addObject("keyword", param.getKeyword());
		
		System.out.println(pageInfo.getPagingHtml());
		this.mav.setViewName(super.getpage);
		return this.mav;
		
	
	}
	
	

}

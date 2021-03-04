package controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Product;
import controller.common.SuperClass;
import dao.ProductDao;
import utility.FlowParameters;
import utility.Paging;

@Controller
public class PlistController extends SuperClass{ // 상품 목록을 보여주는 컨트롤러

	private final String command = "/plist.pr" ; // 요청 커맨드(변경 요망)
	private final String redirect = "redirect:/plist.pr" ; // 리다이렉션(변경 요망)
	
	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null ; 
	
	@Autowired
	@Qualifier("pdao") // (변경 요망)
	private ProductDao pdao ;// (변경 요망)
	
	public PlistController() {
		// (변경 요망)
		super("plist", "plist"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet(
			HttpServletRequest request ,//리퀘스트 저장소만들어주기
			FlowParameters param) { //검색 키워드 필요 파라미터 세팅해주기
		param.setPageSize("20");
		
		System.out.println(this.getClass() + " : " + param.toString());//여기클래스에 파라미터 왔는지 확인
		
		int totalCount  // 검색으로 총 몇개 나왔는지 
			= pdao.SelectTotalCount(param.getMode(), param.getKeyword() + "%");
		
		System.out.println("param.getMode() : " + param.getMode());
		System.out.println("totalCount : " + totalCount);
		
		String contextpath = request.getContextPath() + "/" ;//contextpath 주소지 설정
		
		System.out.println(contextpath);
		
		String myurl = contextpath + this.command ; //url 문자열 짜집기 
		
		
		Paging pageInfo = new Paging( //유틸에있는 paging 객체 생성
				param.getPageNumber() ,
				param.getPageSize() , 
				totalCount , 
				myurl , 
				param.getMode() , 
				param.getKeyword()
				);
		System.out.println("pageInfo : " + pageInfo);
		List<Product> lists = pdao.SelectDataList(
				pageInfo.getOffset(), 
				pageInfo.getLimit(), 
				param.getMode(),
				param.getKeyword());
		
		System.out.println("lists : " + lists);
		
		mav.addObject("lists", lists); // 표에 들어갈 상품 목록들
		
		System.out.println("상품 목록 갯수 : " + lists.size());
		
		// 카테고리 리스트
//		List<Product> clists = pdao.CategoryDataList(
//			param.getKeyword() + "%");
//		System.out.println("채소 / 과일 : " + clists.toString());
		
		mav.addObject("pageInfo" , pageInfo) ; // 페이징 관련 항목들

		// 필드 검색과 관련한 항목들
		mav.addObject("mode" , param.getMode());
		mav.addObject("keyword" , param.getKeyword());

		// 파라미터 리스트 문자열 : 상세보기 수정 , 삭제 , 답글 등에 사용
		mav.addObject("parameters" , param.toString());

		this.mav.setViewName(super.getpage); 
		return this.mav ;
	}
	@PostMapping(command)
	public ModelAndView doPost() {
		this.mav.setViewName(super.postpage); 
		return this.mav ;
	}
	
}
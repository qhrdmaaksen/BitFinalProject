package controller.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import bean.Service;
import controller.common.SuperClass;
import dao.ServiceDao;

@Controller
public class ServiceInsertController extends SuperClass{
	private final String command = "/insert.sr" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/service.sr" ;
	
	@ModelAttribute("service")
	public Service myboard() {
		System.out.println("@ModelAttribute(\"service\")");
		return new Service();
	}
	
	@Autowired
	@Qualifier("sdao")	
	private ServiceDao dao ;


	public ServiceInsertController() {
		super("serviceinsert", "personalservice"); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}
	
	@GetMapping(command)
	public ModelAndView doGet( ) {
		
		this.mav.setViewName(super.getpage);
		return this.mav;
	}
	
	@PostMapping(command)
	public ModelAndView doPost(
			HttpSession session,
			@ModelAttribute("service") Service service,
			BindingResult asdf,
			HttpServletRequest request) {
		
		
		if ( asdf.hasErrors() ) {
			System.out.println("유효성 검사에 문제 있슴");
			System.out.println( asdf );
			this.mav.addObject("bean", service);	
			this.mav.setViewName(super.getpage);
			
		} else {
			System.out.println("유효성 검사에 문제 없슴");
			int cnt = -99999 ; 			
			//Bean 객체를 이용하여 해당 게시물을 추가한다.
			cnt = dao.InsertData(service) ;			
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			this.mav.setViewName(this.redirect);
		}			
		return this.mav ;
	}
	
}
		
//		MultipartFile multi = serivce.getAbcd() ;
//		String uploadPath = "/upload" ;
//		//realPath :  
//		String realPath = request.getRealPath(uploadPath) ;
//		System.out.println(realPath);			
//		
//		try {
//			File destination = utility.Utility.getUploadedFileInfo(multi, realPath);
//			
//			multi.transferTo(destination);
//			
//			serivce.setSimg(destination.getName());
//			this.dao.InsertService(serivce);
//			if(serivce!=null) {
//				
//				this.mav.setViewName(redirect);
//			}
//			
//			
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//			mav.setViewName("") ;
//		}
//		catch (Exception e) {				
//			e.printStackTrace();
//			mav.setViewName(super.getpage) ;
//		}
//		 
//		  
//		return this.mav;
//	}
//	
//	
//}
package controller.service;


import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Serivce;
import controller.common.SuperClass;
import dao.ServiceDao;

@Controller
public class ServiceInsertController extends SuperClass{
	private final String command = "/insert.sr" ; 
	private ModelAndView mav = null ;
	private String redirect = "redirect:/service.sr" ;
	
@Autowired
@Qualifier("sdao")	
private ServiceDao dao ;


	public ServiceInsertController() {
		// 변경 해야함
		super("serviceinsert", "null"); // super(getpage, postpage)
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
			@ModelAttribute("bean") Serivce serivce,
			BindingResult asdf,
			HttpServletRequest request) {
		
		MultipartFile multi = serivce.getAbcd() ;
		String uploadPath = "/upload" ;
		//realPath :  
		String realPath = request.getRealPath(uploadPath) ;
		System.out.println(realPath);			
		
		try {
			File destination = utility.Utility.getUploadedFileInfo(multi, realPath);
			
			multi.transferTo(destination);
			
			serivce.setSimg(destination.getName());
			this.dao.InsertService(serivce);
			if(serivce!=null) {
				
				this.mav.setViewName(redirect);
			}
			
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
			mav.setViewName("") ;
		}
		catch (Exception e) {				
			e.printStackTrace();
			mav.setViewName(super.getpage) ;
		}
		 
		  
		return this.mav;
	}
	
	
}
package controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import controller.common.SuperClass;

@Controller // 관리자가 회원들의 목록을 조회하는 컨트롤러 입니다.
public class MypageController extends SuperClass{
	private final String command = "/mypage.me" ; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.cu" ; // 리 다이렉션 // 변경 해야함
	
	@GetMapping(command)
	public String doGet(){
		return "mypage";
	}
	
	

}

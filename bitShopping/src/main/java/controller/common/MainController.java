package controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController{
	
	@GetMapping("/main.cu")
	public String doGet(){
		return "main";
	}
	

}
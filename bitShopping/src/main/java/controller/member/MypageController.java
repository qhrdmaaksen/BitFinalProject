package controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bean.Member;
import bean.Order;
import controller.common.SuperClass;
import dao.MemberDao;
import dao.OrderDao;

@Controller // 관리자가 회원들의 목록을 조회하는 컨트롤러 입니다.
public class MypageController extends SuperClass {
	private final String command = "/mypage.me"; // 요청 커맨드 // 변경 해야함
	private String redirect = "redirect:/main.cu"; // 리 다이렉션 // 변경 해야함

	// 뷰에 넘겨줄 ModelAndView 객체
	private ModelAndView mav = null;

	@Autowired
	@Qualifier("mdao") // (변경 요망)
	private MemberDao mdao;// (변경 요망)

	@Autowired
	@Qualifier("odao")
	private OrderDao odao;

	public MypageController() {
		// (변경 요망)
		super("mypage", null); // super(getpage, postpage)
		this.mav = new ModelAndView();
	}

	@GetMapping(command)
	public ModelAndView doGet( // mid 파라미터로 , 필수 , 타입은 String
			@RequestParam(value = "mid", required = true) String mid, HttpSession session) {

		Member loginfo = (Member) session.getAttribute("loginfo");

		List<Order> lists = odao.OrderList(loginfo.getMid());
		mav.addObject("lists", lists);
		System.out.println("lists : " + lists);

		Member member = this.mdao.SelectDataByPk(mid);
		System.out.println(member);

		this.mav.addObject("member", member);

		this.mav.setViewName(super.getpage); // main 페이지로 이동
		return this.mav;
	}

}

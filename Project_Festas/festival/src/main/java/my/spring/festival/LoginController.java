package my.spring.festival;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.FestivalDAO;
import vo.FestivalVO;
import vo.MemberinfoVO;

@Controller
public class LoginController {
	@Autowired
	FestivalDAO dao;

	//로그인 입력페이지
	@RequestMapping("/loginmain")
	@ResponseBody
	public ModelAndView loginmain() {
		ModelAndView mav = new ModelAndView();
		System.out.println("loginmain 호출 ");
		mav.setViewName("login");
		return mav;
	}

	//로그인 처리 페이지
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(String mid, String pw, HttpSession session,HttpServletRequest request) {
		MemberinfoVO vo = dao.checklogin(mid, pw);
		System.out.println("login 화면 호출");
		if (vo != null) {
			session.setAttribute("mid", vo.getMid());
			System.out.println(vo.getMid());
			return "true";
		}
		return "false";
	}
	
	//로그아웃 
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("festivalMain");
		return mav;
	}

}
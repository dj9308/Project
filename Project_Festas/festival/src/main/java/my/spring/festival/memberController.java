package my.spring.festival;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.FestivalDAO;
import vo.MemberinfoVO;

@Controller
public class memberController {

	@Autowired
	FestivalDAO dao;
		
		// 메인페이지
		@RequestMapping(value="/mainpage")
		public ModelAndView mainpage() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("festivalMain");
			return mav;
		}
	
		// 회원가입 폼 처리
		@RequestMapping(value="/memberForm")
		public ModelAndView signup(MemberinfoVO vo, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			if (request.getMethod().equals("GET")) {
				System.out.println("GET일떄");
				mav.setViewName("memberForm");
				return mav;
			}
			
			System.out.println("GET 아닐때");
			dao.insert(vo);
			mav.setViewName("festivalMain");
			return mav;
		}
			
		@RequestMapping(value="/validateForm")
		@ResponseBody
		public int idCheck(String mid) {
			System.out.println("Controller에 넘어온 id값 "+mid);
			if (dao.checkId(mid)) return 1;
			else return 0;
		}
}




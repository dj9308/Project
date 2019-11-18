package com.spring.dalhada;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import service.MemberService;
import vo.MemberinfoVO;
import vo.NaverLoginVO;

@Controller
public class LoginController {
	@Autowired
	MemberService service;
	@Autowired
	NaverLoginVO NaverLoginVO;

	private String apiResult = null;

	// 로그인 입력페이지
	@RequestMapping("/loginmain")
	@ResponseBody
	public ModelAndView loginmain(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String naverAuthUrl = NaverLoginVO.getAuthorizationUrl(session);

		mav.addObject("url", naverAuthUrl);
		mav.setViewName("login");
		return mav;
	}

	// 네아로
	@RequestMapping(value = "/NaverLogin")
	public ModelAndView NaverLogin(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) throws IOException, ParseException {
		ModelAndView mav = new ModelAndView();
		OAuth2AccessToken oauthToken;
		oauthToken = NaverLoginVO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = NaverLoginVO.getUserProfile(oauthToken); // String형식의 json데이터
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		String BirthYear = (String) response_obj.get("age");
		BirthYear = BirthYear.substring(0, 1);

		// 4. DB에 네아로로 저장된 아이디가 있는지 확인.
		MemberinfoVO vo = service.checklogin(nickname);
		if (vo == null) {
			// 5.vo에 넣기
			vo = new MemberinfoVO();
			vo.setId(nickname);
			vo.setEmail((String) response_obj.get("email"));
			vo.setImage_path((String) response_obj.get("profile_image"));
			service.insert(vo);
		}
		// String old_url = request.getHeader("referer");
		session.setAttribute("id", nickname);
		mav.setViewName("main");
		return mav;
	}

	@RequestMapping(value = "/login")
	@ResponseBody
	// 로그인 처리 페이지
	public String login(String id, String password, HttpSession session, HttpServletRequest request) {
		MemberinfoVO vo = service.checklogin(id);
		String result = "false";
		if (vo != null) {
			if (BCrypt.checkpw(password, vo.getPassword())) {
				session.setAttribute("id", vo.getId());
				result =  "true";
			}
		}
		return result;
	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/main");
		return mav;
	}

}
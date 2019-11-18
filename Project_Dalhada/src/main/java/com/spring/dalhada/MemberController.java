package com.spring.dalhada;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberinfoVO;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
		
		// 회원가입 폼 처리
		@RequestMapping(value="/memberform")
		public ModelAndView signup(MemberinfoVO vo, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			if (request.getMethod().equals("GET")) {
			     mav.setViewName("memberform");
			}else {
//				Bcrypt 암호화
				String hashPwd = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
				vo.setPassword(hashPwd);
				if(!vo.getImage().getContentType().equals("application/octet-stream")) {
					String fileName = vo.getImage().getOriginalFilename();
					String newName = vo.getId()+"_"+fileName;
					vo.setImage_path(newName);
					service.insert(vo);
				     byte[] content = null;
				     mav.setViewName("login");
				     String imageurl = PathFinder.findImagePath("/profile/");
				     try {
				    	 content =  vo.getImage().getBytes();
				    	 File f = new File(imageurl+fileName);			   
				    	 FileOutputStream fos = new FileOutputStream(f);
				    	 fos.write(content);
				    	 fos.close();
				    	 
					     File newf = new File(imageurl+newName);
					     if(f.exists())
					    	 f.renameTo(newf);
				     } catch (IOException e) {
				    	 e.printStackTrace();
				     }	
				}else {
					service.insert(vo);
					mav.setViewName("login");
				}
			
			}
			return mav;
		}
			
		@RequestMapping(value="/validateForm")
		@ResponseBody
		public int idCheck(String id) {
			if (service.checkId(id)) {
				return 1;
			}
			else return 0;
		}
}
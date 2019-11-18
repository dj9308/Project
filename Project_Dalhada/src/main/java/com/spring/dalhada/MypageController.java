package com.spring.dalhada;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.AchieveService;
import service.MypageService;
import vo.AchieveVO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;
import vo.MypageVO;


@Controller
public class MypageController {
	@Autowired
	MypageService service;
	String id = null;
	@Autowired
	private AchieveService achieveService;

	@RequestMapping(value = "/achieve")
	public ModelAndView achieve(HttpSession session, @RequestParam(required=false) String age) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		List<AchieveVO> achieveList = achieveService.selectCompleteBucket(id);
		List<Integer> diAgeList = new ArrayList<Integer>();
		List<Integer> aList = new ArrayList<Integer>();
		List<Integer> moveList = new ArrayList<Integer>();
		
		if(achieveList.size() != 0) {
			for(AchieveVO vo:achieveList) {
				diAgeList.add(vo.getAge());
				aList.add(vo.getAge());
				moveList.add(vo.getSelectedbucket_id());
			}
			HashSet<Integer> ageData = new HashSet<Integer>(diAgeList);
			diAgeList = new ArrayList<Integer>(ageData);
			mav.addObject("diAgeList", diAgeList); //중복제거
			mav.addObject("aList",aList);
			mav.addObject("moveList",moveList);
		}
		mav.addObject("achieveList", achieveList);
		mav.setViewName("achieve");
		return mav;
	}
	
	
	@RequestMapping(value = "/mypage")
	public ModelAndView get(MemberinfoVO vo, HttpSession session, HttpServletRequest request,MypageVO vo1) {
		ModelAndView mav = new ModelAndView();
		id = (String) session.getAttribute("id");
		vo.setId(id);
		vo1.setMember_id(id);
		
		if (id != null) {
			if (request.getMethod().equals("POST")) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member_id", id);
				
				if(vo1.getAction()!=null) { // 개인정보 수정
				if(vo1.getAction().equals("UpCheck")) { // 비밀번호 수정
					String hashPwd = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
					vo.setPassword(hashPwd);
					service.UpCheck(vo);
					
				}else if(vo1.getAction().equals("UpInfo")) { // 나머지 개인정보 수정
					String originFilename = service.UserInfo(vo).getImage_path();
					if(!vo.getImage().getContentType().equals("application/octet-stream")) {
						String fileName = vo.getImage().getOriginalFilename();
						String newName = vo.getId()+"_"+fileName;
						vo.setImage_path(newName);
						service.UpInfo(vo);
					     byte[] content = null;
					     mav.setViewName("login");
					     String imageurl = PathFinder.findImagePath("/profile/");
					     try {
					    	 
					    	 File originFilepath = new File(imageurl+originFilename);
					    	 if(originFilepath.exists()) {
					    		 originFilepath.delete();	 
					    	 }
					    	 
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
						vo.setImage_path(originFilename);
						service.UpInfo(vo);
					}
				}
				}
				
				if(vo1.getGroup1()!=null && vo1.getGroupnum()!=null) { // 그룹 업데이트
					for(int i=0; i<vo1.getGroup1().length;i++) {
						if(!vo1.getGroup1()[i].equals(vo1.getOriGroup()[i])) {
							map.put("id",Integer.parseInt(vo1.getGroupnum()[i]));
							map.put("name", vo1.getGroup1()[i]);
							service.updateGroup(map);
							break;
						}
					}
				}
				
				if(vo1.getCreGroup()!=null) {//그룹 작성
					for(int i=0;i<vo1.getCreGroup().length;i++) {
						map.put("CreGroup", vo1.getCreGroup()[i]);
						service.CreateGroup(map);
					}
				}
				
				if (vo1.getBox() != null) { // 체크박스로 삭제하기
					for (int i = 0; i < vo1.getBox().length; i++) {
						service.delete(Integer.parseInt(vo1.getBox()[i]));
					}
				}
			}

			Map<String, Object> choose = new HashMap<String, Object>();
			choose.put("id", id);
			choose.put("stat",'p');	//진행률 표현위해 먼저 완료한 버킷으로 표현.
			
			
			List<MypageBucketVO> listAll = null;
			List<MypageBucketVO> listDone = null;
			
			if(vo1.getGroup() != null && !vo1.getGroup().equals("all")) {
				choose.put("group_id", vo1.getGroup());
				listAll = service.GroupAllBuck(choose);
				listDone = service.groupChos(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", service.groupChos(choose));
			}else {
				listAll = service.bucketAll(id);
				listDone = service.choose(choose);
				choose.put("stat",'f');
				mav.addObject("listProg", service.choose(choose));
			}
			
			int ProgNum = (int) (listDone.size() / (double) listAll.size() * 100);
			mav.addObject("perc", ProgNum);
			
			mav.addObject("listAll", listAll);
			mav.addObject("listDone", listDone);
			mav.addObject("info", service.UserInfo(vo));
			mav.addObject("group", service.groupList(id));
			mav.setViewName("mypage");
		} else {
			mav.setViewName("redirect:/loginmain");
		}
		return mav;
	}
	@RequestMapping(value = "/delGroup", method = RequestMethod.POST)
	@ResponseBody
	public String login(String id) {
		if (service.DeleteGroup(Integer.parseInt(id))) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping(value = "/comp", method = RequestMethod.POST)
	@ResponseBody
	public String comp(String mid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", id);
		map.put("id", Integer.parseInt(mid));
		if(service.complete(map) && service.CreateDiary(Integer.parseInt(mid))) {
			return "true";
		}return "false";
	}
	
	@RequestMapping(value = "/Checkpw", method = RequestMethod.POST)
	@ResponseBody
	public String Checkpw(String password) {
		if (BCrypt.checkpw(password, service.Checkpw(id))) {
			return "true";
		}else return "false";
	}
}

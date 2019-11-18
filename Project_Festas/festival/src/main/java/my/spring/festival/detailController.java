package my.spring.festival;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import dao.detailDAO;
import vo.NoticeVO;
import vo.detailReviewVO;
import vo.detailVO;

@Controller
public class detailController {
	@Autowired
	 detailDAO dao;
	
	String fidd;
	@RequestMapping(value="/detail",method=RequestMethod.GET)
    public ModelAndView detailGet(detailVO vo, detailReviewVO vo1, HttpSession session, 
    		String fid, String action, String review_id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("mid");
		fidd = fid;
		
		if(fid!=null) {
			if(mid!=null) {
			if(action!=null && mid!=null) {
				if(action.equals("redirect")) {
					String referer1 = request.getHeader("referer");
					mav.setViewName("redirect:"+referer1);
				}else if(action.equals("insert")) {
				vo1.setFid(Integer.parseInt(fid));
				vo1.setMid(mid);
				detailReviewVO check = dao.basketCheck(vo1);
				
				if(check==null) {
					if(dao.insertBasket(vo1)) {
					System.out.println("insert 완료");
					mav.addObject("msg", "찜목록에 추가되었습니다.");
				}
				}else {
					if(Integer.parseInt(fid)==check.getFid() && mid.equals(check.getMid())) {
						mav.addObject("msg", "이미 찜목록에 있습니다.");
					}else {
						if(dao.insertBasket(vo1)) {
							System.out.println("insert 완료");
							mav.addObject("msg", "찜목록에 추가되었습니다.");
						}
					}
				}
				}
			}
			mav.addObject("exist","로그인");
			}				
			mav.addObject("festival", dao.festival(Integer.parseInt(fid)));
			mav.addObject("img", dao.imgList(Integer.parseInt(fid)));
			mav.addObject("review", dao.reviewList(Integer.parseInt(fid)));
			mav.addObject("map", dao.festival(Integer.parseInt(fid)));
			 mav.setViewName("detail");
		}else {
			mav.addObject("msg","잘못된 주소입니다.");
			 mav.setViewName("festivalMain");
		}
        
        return mav;
  }
	
	@RequestMapping(value="/detail",method=RequestMethod.POST)
    public ModelAndView detailPost(detailVO vo, detailReviewVO vo1, HttpSession session, String action,
    		String fid) {
		ModelAndView mav = new ModelAndView();
		String mid = (String)session.getAttribute("mid");
		if(fid!=null) {
			if(action.equals("insReview")) {
				System.out.println("form 수행 시작");
				vo1.setMid(mid);
				vo1.setFid(Integer.parseInt(fid));
				if (dao.insertReview(vo1)) {
					System.out.println("insert 완료");
					mav.addObject("msg", "작성이 완료되었습니다.");
				}
				else {
					System.out.println("insert 실패");
					mav.addObject("msg", "리뷰 작성에 실패했습니다.");
				}
			}
	        if(mid!=null) {
	        	mav.addObject("exist","로그인");
	        }
	        mav.addObject("festival", dao.festival(Integer.parseInt(fid)));
			mav.addObject("img", dao.imgList(Integer.parseInt(fid)));
			mav.addObject("review", dao.reviewList(Integer.parseInt(fid)));
			mav.addObject("map", dao.festival(Integer.parseInt(fid)));
		}

        mav.setViewName("detail");
        return mav;
  }
	@RequestMapping(value = "/detail/report")
	public String createreport(HttpServletRequest request, detailReviewVO info) {
		dao.report(info);
		return "success";
	}
}

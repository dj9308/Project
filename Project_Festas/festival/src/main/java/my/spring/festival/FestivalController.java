package my.spring.festival;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.FestivalDAO;
import dao.detailDAO;
import vo.FestivalVO;
import vo.LatlngVO;
import vo.PageList;
import vo.SearchFestaInfoVO;

@Controller
@SessionAttributes(value = "festainfo")
public class FestivalController {

	@Autowired
	FestivalDAO dao;
	detailDAO dao2;
	
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
    public ModelAndView mainView() {
		ModelAndView mav = new ModelAndView();
		List<Integer> img =dao.imgSlide(1);
		List<Integer> img2 =dao.imgSlide(2);
		mav.addObject("img",img);
		mav.addObject("img2",img2);
		mav.setViewName("festivalMain");
        return mav;
  }
	@RequestMapping(value="/main2",method=RequestMethod.GET)
    public ModelAndView mainView2(String action) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
        return mav;
  }
	
	//festivalSelect
		@RequestMapping(value = "/select", method = RequestMethod.GET)
		@ResponseBody
		public ModelAndView select(String fid) {
			ModelAndView mav = new ModelAndView();

			FestivalVO vo = dao.festivalSelect(fid);
			mav.setViewName("detail");
			return mav;

		}
		
		int size = 5;
		@ModelAttribute("festainfo")
		public SearchFestaInfoVO createFestainfo() {
			return new SearchFestaInfoVO();
		}
		
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public ModelAndView showList(@ModelAttribute("festainfo") SearchFestaInfoVO festainfo, SearchFestaInfoVO info,
				int pageNo) {
			
			List<FestivalVO> tmplist;
			ModelAndView mav = new ModelAndView();
			if (info.getAction().equals("search"))
				festainfo = info;
			int total = dao.selectCount(festainfo);
			festainfo.setStartRow((pageNo-1)*size+1);
			festainfo.setEndRow(pageNo*size);
			System.out.println(festainfo.toString());
			tmplist = dao.search(festainfo);
			
			if (tmplist.size() == 0) {
				mav.addObject("listmsg", "검색하신 정보에 해당하는 축제가 존재하지 않습니다.");
			} else {
				mav.addObject("resultlist", new PageList<FestivalVO>(total, pageNo, size, tmplist));
			}
			mav.addObject("center",
					festainfo.getDistrict().equals("") ? "서울" : festainfo.getCity() + festainfo.getDistrict());
			mav.addObject("mapinfo", tmplist);
			mav.setViewName("showlist");
			return mav;
		}
		
		//위도 경도
		@RequestMapping(value="/selectplace")
		public ModelAndView selectPlace() {
			List<LatlngVO> tmplist;
			ModelAndView mav = new ModelAndView();
			tmplist = dao.selectPlace();
			if (tmplist.size() == 0) {
				System.out.println("/selectplace list size is 0");
			} else {
				mav.addObject("resultlist", tmplist);
			}
			mav.setViewName("changelatlng");
			return mav;
		}
		
		@RequestMapping(value="/changelatlng")
		@ResponseBody
		public String changeLatlng(LatlngVO info) {
			int size = dao.updateLatlng(info);
			System.out.print("size: ");
			System.out.println(size);
			return "success";
		}
}
		
	


package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FestivalVO;
import vo.LatlngVO;
import vo.MemberinfoVO;
import vo.SearchFestaInfoVO;

@Repository
public class FestivalDAO {
	@Autowired
	SqlSession session = null;
	
	public boolean insert(MemberinfoVO vo) {
		boolean result=true;
		String statement = "resource.MemberMapper.insertMember";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean checkId(String mid) {
		String statement = "resource.MemberMapper.checkId";
		if (session.selectOne(statement, mid) != null) {
			return true;
		}
		return false;
	}	
	
	public MemberinfoVO checklogin(String mid, String pw) {
		String statement= "resource.MemberMapper.login";
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("mid", mid);
		map.put("pw", pw);
		MemberinfoVO vo = session.selectOne(statement,map);
		if(session.selectOne(statement,map) != null) return vo;
		return null;
	}	
	
	public FestivalVO festivalSelect(String fid) {
		String statement= "resource.MemberMapper.festivalSelect";
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("fid", fid);
		FestivalVO vo = session.selectOne(statement,map);
		if(session.selectOne(statement,map) != null) return vo;
		return null;
	}
	
	public List<FestivalVO> search(SearchFestaInfoVO  info){
		List<FestivalVO> list;
		String statement = "resource.FestivalMapper.selectFestival";
		list = session.selectList(statement, info);
		return list;
	}
	public int selectCount(SearchFestaInfoVO  info) {
		String statement = "resource.FestivalMapper.selectFestivalCount";
		return session.selectOne(statement, info);
	}
	//�쐞�룄 寃쎈룄
		public List<LatlngVO> selectPlace(){
			List<LatlngVO> list;
			String statement = "resource.NoticeMapper.searchPlace";
			list = session.selectList(statement);
			return list;
		}
		public int updateLatlng(LatlngVO info) {
			String statement = "resource.NoticeMapper.updateLatlng";		
			return session.update(statement, info);
		}
		public List<Integer> imgSlide(int num){
			List<Integer> list;
			String statement = "resource.FestivalMapper.selecImgSlide";
			list = session.selectList(statement,num);
			return list;
		}
		
}





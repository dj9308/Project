package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MemberinfoVO;
import vo.MyPageVO;
import vo.detailReviewVO;
import vo.detailVO;

@Repository
public class detailDAO {
	@Autowired
	SqlSession session = null;
	
	public List<detailVO> listAll(int fid){
		List<detailVO> list = null;
		String statement = "resource.detailMapper.selectAll";
		list = session.selectList(statement, fid);
		return list;
	}
	
	public List<detailVO> imgList(int fid){
		List<detailVO> list = null;
		String statement = "resource.detailMapper.imgList";
		list = session.selectList(statement, fid);
		return list;
	}
	
	public List<detailReviewVO> reviewList(int fid){
		List<detailReviewVO> list = null;
		String statement = "resource.detailMapper.reviewList";
		list = session.selectList(statement, fid);
		return list;
	}
	
	public boolean insertReview(detailReviewVO vo) {
		boolean result=true;
		String statement = "resource.detailMapper.insertReview";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean insertBasket(detailReviewVO vo) {
		boolean result=true;
		String statement = "resource.detailMapper.insertBasket";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public boolean report(detailReviewVO vo) {
		boolean result=true;
		String statement = "resource.detailMapper.report";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	public detailReviewVO basketCheck(detailReviewVO vo1) {
		detailReviewVO vo = null;
		String statement = "resource.detailMapper.basketCheck";
		vo = session.selectOne(statement, vo1);
		return vo;
	}
	
	public detailVO festival(int fid) {
		detailVO vo = null;
		String statement = "resource.detailMapper.selectAll";
		vo = session.selectOne(statement, fid);
		return vo;
	}
}

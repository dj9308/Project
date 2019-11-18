package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.MyPageBasketVO;
import vo.MyPageReviewVO;
import vo.MyPageVO;

@Repository
public class MyPageDAO {
	@Autowired
	SqlSession session = null;
	
	public MyPageVO listOne(String mid) {
		MyPageVO vo = null;
		String statement = "resource.MyPageMapper.info";
		vo = session.selectOne(statement, mid);
		return vo;
	}
	public MyPageVO pw(String mid) {
		MyPageVO vo = null;
		String statement = "resource.MyPageMapper.info";
		vo = session.selectOne(statement, mid);
		return vo;
	}
	public boolean update(MyPageVO vo) {
		String statement = "resource.MyPageMapper.update";
		if (session.update(statement, vo) != 1) return false;
		return true;
	}
	public boolean updatepm(MyPageVO vo) {
		String statement = "resource.MyPageMapper.updatepm";
		if (session.update(statement, vo) != 1) return false;
		return true;
	}
	
	public List<MyPageReviewVO> reviewList(MyPageReviewVO vo){
		List<MyPageReviewVO> list = null;
		String statement = "resource.MyPageMapper.reviewInfo";
		list = session.selectList(statement, vo);
		return list;
	}
	public List<MyPageBasketVO> basket(MyPageBasketVO vo){
		List<MyPageBasketVO> list = null;
		String statement = "resource.MyPageMapper.basket";
		list = session.selectList(statement, vo);
		return list;
	}
	public boolean delete(MyPageBasketVO vo) {
		String statement = "resource.MyPageMapper.delete";
		System.out.println("삭제 시작");
		if (session.delete(statement, vo) != 1) return false;
		return true;
	}
	
	public boolean deleteRev(MyPageReviewVO vo) {
		String statement = "resource.MyPageMapper.deleteRev";
		System.out.println("삭제 시작");
		if (session.delete(statement, vo) != 1) return false;
		return true;
	}
}

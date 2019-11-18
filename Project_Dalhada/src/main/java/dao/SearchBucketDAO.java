package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BucketVO;
import vo.SearchBucketVO;
import vo.TagInfoVO;

@Repository
public class SearchBucketDAO {
	@Autowired
	SqlSession session = null;
	
	//제목검색 검색결과 수
	public int getTotalTitleCnt(String keyword) {
		String statement = "resource.SearchBucketMapper.totalTitleCnt";
		return session.selectOne(statement, keyword);
	}	
	
	//제목검색
	public List<BucketVO> searchTitle(SearchBucketVO vo){
		List<BucketVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTitle";
		list = session.selectList(statement, vo);
		return list;
	}
	
	//태그검색 검색결과 수
	public int getTotalTagCnt(String tagName) {
		String statement = "resource.SearchBucketMapper.totalTagCnt";
		return session.selectOne(statement, tagName);
	}	
		
	//태그검색
	public List<BucketVO> searchTag(SearchBucketVO vo){
		List<BucketVO> list = null;
		String statement = "resource.SearchBucketMapper.searchTag";
		list = session.selectList(statement, vo);
		return list;
	}
	
	//태그명 찾기
	public List<TagInfoVO> selectTagName() {
		List<TagInfoVO> list = null;
		String statement = "resource.SearchBucketMapper.selectTagName";
		list = session.selectList(statement);
		return list;
	}
}
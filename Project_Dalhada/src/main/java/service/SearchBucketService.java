package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SearchBucketDAO;
import vo.BucketVO;
import vo.SearchBucketVO;
import vo.TagInfoVO;

@Service
public class SearchBucketService {
	@Autowired
	private SearchBucketDAO dao;
	
	//제목검색 검색결과 수
	public int getTotalTitleCnt(String keyword) {
		return dao.getTotalTitleCnt(keyword);
	}	
	
	//제목검색
	public List<BucketVO> searchTitle(SearchBucketVO vo){
		return dao.searchTitle(vo);
	}
	
	//태그검색 검색결과 수
	public int getTotalTagCnt(String tagName) {
		return dao.getTotalTagCnt(tagName);
	}	
		
	//태그검색
	public List<BucketVO> searchTag(SearchBucketVO vo){
		return dao.searchTag(vo);
	}
	
	//태그명 찾기
	public List<TagInfoVO> selectTagName() {
		return dao.selectTagName();
	}
}

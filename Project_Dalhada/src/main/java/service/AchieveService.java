package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AchieveDAO;
import vo.AchieveVO;

@Service
public class AchieveService {
	@Autowired
	private AchieveDAO dao;
	
	//완료,상세버킷 select
	public List<AchieveVO> selectCompleteBucket(String id){
		return dao.selectCompleteBucket(id);
	}
	
	//상세버킷 선택된 태그 select
	public List<String> selectedTag(int selectedbucket_id){
		return dao.selectedTag(selectedbucket_id);
	}
}

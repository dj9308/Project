package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MypageDAO;
import vo.GroupVO;
import vo.MemberinfoVO;
import vo.MypageBucketVO;

@Service
public class MypageService {
	@Autowired
	MypageDAO Dao;

	public MemberinfoVO UserInfo(MemberinfoVO vo1) {
		return Dao.UserInfo(vo1);
	}
	
	public String Checkpw(String id) {
		return Dao.Checkpw(id);
	}
	
	public boolean UpCheck(MemberinfoVO vo) {
		if(Dao.UpCheck(vo)!=1) return false;
		return true;
	}
	
	public boolean UpInfo(MemberinfoVO vo) {
		if(Dao.UpInfo(vo)!=1) return false;
		return true;
	}
	
	public List<GroupVO> groupList(String id) {
		return Dao.groupList(id);
	}
	
	public List<MypageBucketVO> GroupAllBuck(Map<String, Object> map){
		return Dao.GroupAllBuck(map);
	}
	
	public List<MypageBucketVO> groupChos(Map<String, Object> map){
		return Dao.groupChos(map);
	}
	
	public List<MypageBucketVO> bucketAll(String id){
		return Dao.bucketAll(id);
	}
	
	
	public List<MypageBucketVO> choose(Map<String, Object> map){
		return Dao.choose(map);
	}
	
	public boolean delete(int id) {
		if (Dao.delete(id) != 1)
			return false;
		return true;
	}
	
	public boolean complete(Map<String, Object> map) {
		if (Dao.complete(map) != 1)
			return false;
		return true;
	}
	
	public boolean updateGroup(Map<String, Object> map) {
		if (Dao.updateGroup(map) != 1) return false;
		return true;
	}
	
	public boolean CreateGroup(Map<String, Object> map) {
		if (Dao.CreateGroup(map) != 1) return false;
		return true;
	}
	
	public boolean DeleteGroup(int id) {
		Dao.DefaultGroup(id); 
			if(Dao.DeleteGroup(id)==1) {
				return true;
			}
			return false;
	}
	
	public boolean CreateDiary(int id) {
		boolean result = true;
		if (Dao.CreateDiary(id) != 1) result = false;
		return result;
	}
}

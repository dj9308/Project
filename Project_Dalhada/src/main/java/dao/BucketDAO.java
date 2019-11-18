package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.*;

@Repository
public class BucketDAO {
	@Autowired
	SqlSession session = null;
	
	public BucketDetailVO selectDetail(StringIntVO map) {
		BucketDetailVO vo = new BucketDetailVO();
		int selectedbucket_id = map.getId();
		String statement = "resource.BucketMapper.detailBucket";
		vo = session.selectOne(statement, map);
		statement = "resource.BucketMapper.selectedTags";
		List<String> tags = session.selectList(statement, selectedbucket_id);
		vo.setTags(tags);
		return vo;
	}
	public List<BucketVO> selectTOPBucket(String member_id) {
		List<BucketVO> list = new ArrayList<BucketVO>();
		String statement = "resource.BucketMapper.selectTOPBucket";
		list = session.selectList(statement, member_id);
		return list;
	}
	public List<TagInfoVO> popularTags(StringIntVO vo){
		List<TagInfoVO> list = new ArrayList<TagInfoVO>();
		String statement = "resource.BucketMapper.popularTags";
		list = session.selectList(statement, vo);
		return list;
	}
	public List<BucketVO> selectTagBucket(StringIntVO vo){
		List<BucketVO> list = new ArrayList<BucketVO>();
		String statement = "resource.BucketMapper.selectTagBucket";
		list = session.selectList(statement, vo);
		return list;
	}
	public List<BucketVO> selectSimilarBucket(String member_id){
		List<BucketVO> list = new ArrayList<BucketVO>();
		String statement = "resource.BucketMapper.selectSimilarBucket";
		list = session.selectList(statement, member_id);
		return list;
	}
	public int insertLikeInfo(LikeInfoVO vo) {
		String statement = "resource.BucketMapper.insertLike";
		return session.update(statement, vo);
	}
	public int deleteLikeInfo(LikeInfoVO vo) {
		int result;
		String statement = "resource.BucketMapper.deleteLike";
		result = session.delete(statement, vo);
		return result;
	}
	public int countLike(int selectedbucket_id) {
		String statement = "resource.BucketMapper.countLike";
		return session.selectOne(statement, selectedbucket_id);
	}
	public List<StringIntVO> selectGroups(String member_id) {
		String statement = "resource.SearchBucketMapper.selectGroupName";
		return session.selectList(statement, member_id);
	}
	public List<StringIntVO> selectTags() {
		String statement = "resource.SearchBucketMapper.selectTags";
		return session.selectList(statement);
	}
	public String insertbucket(InsertedBucketVO vo) {
		String result = "";
		String statement = "resource.BucketMapper.insertBucket";
		session.insert(statement, vo);
		statement = "resource.BucketMapper.selectImagePath";
		String member_id = vo.getMember_id();
		result = session.selectOne(statement, member_id);
		return result;
	} 
	public int insertGetBucket(InsertedBucketVO vo) {
		String statement = "resource.BucketMapper.insertGetBucket";
		return session.insert(statement, vo);
	}
	public EditBucketInfoVO getEditInfo(StringIntVO map) {
		String statement = "resource.BucketMapper.editBucketInfo";
		return session.selectOne(statement, map);
	}
	public List<Integer> selectTagInfo(int selectedbucket_id) {
		String statement = "resource.BucketMapper.bucketTagInfo";
		return session.selectList(statement, selectedbucket_id);
	}
	public int updateBucket(UpdatedBucketVO vo) {
		String statement =  "resource.BucketMapper.updateTags";
		session.update(statement, vo);
		statement = "resource.BucketMapper.updateBucket";
		return session.update(statement, vo);
	}
}

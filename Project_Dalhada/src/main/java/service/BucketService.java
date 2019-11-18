package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BucketDAO;
import vo.BucketDetailVO;
import vo.BucketVO;
import vo.EditBucketInfoVO;
import vo.InsertedBucketVO;
import vo.LikeInfoVO;
import vo.StringIntVO;
import vo.TagInfoVO;
import vo.UpdatedBucketVO;

@Service("bucketService")
public class BucketService {
	@Autowired
	BucketDAO bucketdao;

	public List<BucketVO> selectTOPBucket(String member_id) {
		List<BucketVO> list = bucketdao.selectTOPBucket(member_id);
		for(BucketVO vo: list) {
			vo.addClass();
		}
		return list;
	}
	public List<TagInfoVO> popularTags(StringIntVO vo){
		List<TagInfoVO> list = bucketdao.popularTags(vo);
		return list;
	}
	public List<BucketVO> selectTagBucket(int tag_id) {
		StringIntVO info = new StringIntVO(tag_id, null);
		List<BucketVO> list = bucketdao.selectTagBucket(info);
		return list;
	}
	public List<BucketVO> selectMyTagBucket(int tag_id, String member_id) {
		StringIntVO info = new StringIntVO(tag_id, member_id);
		List<BucketVO> list = bucketdao.selectTagBucket(info);
		for(BucketVO vo: list) {
			vo.addClass();
		}
		return list;
	}
	public List<BucketVO> selectSimilarBucket(String member_id) {
		List<BucketVO> list = bucketdao.selectSimilarBucket(member_id);
		for(BucketVO vo: list) {
			vo.addClass();
		}
		return list;
	}
	public int insertLikeInfo(LikeInfoVO vo) {
		bucketdao.insertLikeInfo(vo);
		return bucketdao.countLike(vo.getSelectedbucket_id());
	}

	public int deleteLikeInfo(LikeInfoVO vo) {
		bucketdao.deleteLikeInfo(vo);
		return bucketdao.countLike(vo.getSelectedbucket_id());
	}

	public BucketDetailVO selectDetail(StringIntVO map) {
		BucketDetailVO vo = bucketdao.selectDetail(map);
		vo.addClass();
		return vo;
	}

	public List<StringIntVO> selectGroups(String member_id) {
		return bucketdao.selectGroups(member_id);
	}

	public List<StringIntVO> selectTags() {
		return bucketdao.selectTags();
	}

	public String insertBucket(InsertedBucketVO vo) {
		return bucketdao.insertbucket(vo);
	}
	
	public int insertGetBucket(InsertedBucketVO vo) {
		return bucketdao.insertGetBucket(vo);
	}

	public EditBucketInfoVO getEditInfo(StringIntVO map) {
		EditBucketInfoVO vo = bucketdao.getEditInfo(map);
		vo.setGroup_list(bucketdao.selectGroups(map.getName()));
		vo.setTag_list(bucketdao.selectTags());
		vo.setMy_tags(bucketdao.selectTagInfo(map.getId()));
		return vo;
	}

	public int updateBucket(UpdatedBucketVO vo) {
		return bucketdao.updateBucket(vo);
	}
}
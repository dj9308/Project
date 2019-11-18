package vo;

import java.util.List;

public class BucketLists {
	private String title;
	private List<BucketVO> bucketList;
	
	public BucketLists(String title, List<BucketVO> list) {
		this.title = title;
		this.bucketList = list;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<BucketVO> getBucketList() {
		return bucketList;
	}
	public void setBucketList(List<BucketVO> bucketList) {
		this.bucketList = bucketList;
	}
	
}

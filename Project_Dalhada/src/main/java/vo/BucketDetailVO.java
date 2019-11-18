package vo;

import java.util.List;

public class BucketDetailVO {
	private int bucket_id;
	private int selectedbucket_id;
	private String title;
	private String content;
	private String address;
	private float lat;
	private float lng;
	private String bucketImage_path;
	private String profileImage_path;
	private int like_cnt;
	private int islike;
	private String className;
	private String get_member_id;
	private String by_member_id;
	private List<String> tags;
	
	public int getBucket_id() {
		return bucket_id;
	}
	public void setBucket_id(int bucket_id) {
		this.bucket_id = bucket_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public String getBucketImage_path() {
		return bucketImage_path;
	}
	public void setBucketImage_path(String bucketImage_path) {
		this.bucketImage_path = bucketImage_path;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProfileImage_path() {
		return profileImage_path;
	}
	public void setProfileImage_path(String profileImage_path) {
		this.profileImage_path = profileImage_path;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLikecnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getGet_member_id() {
		return get_member_id;
	}
	public void setGet_member_id(String get_member_id) {
		this.get_member_id = get_member_id;
	}
	public String getBy_member_id() {
		return by_member_id;
	}
	public void setBy_member_id(String by_member_id) {
		this.by_member_id = by_member_id;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	public int getIslike() {
		return islike;
	}
	public void setIsLike(int isLike) {
		this.islike = isLike;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public void addClass() {
		this.setClassName(islike==0?"":"js-addedlike"); 
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSelectedbucket_id() {
		return selectedbucket_id;
	}
	public void setSelectedbucket_id(int selectedbucket_id) {
		this.selectedbucket_id = selectedbucket_id;
	}
}

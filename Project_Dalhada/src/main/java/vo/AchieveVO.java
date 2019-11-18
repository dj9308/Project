package vo;

import java.util.List;

public class AchieveVO {
	private String bucketImage_path;
	private int selectedbucket_id; 
	private String title;
	private String sb_content;
	private String address;
	private float lat;
	private float lng;
	private String complete_date;
	private String di_content;
	private int like_cnt;
	private int age;
	private List<String> tags;
	
	public String getBucketImage_path() {
		return bucketImage_path;
	}
	public void setBucketImage_path(String bucketImage_path) {
		this.bucketImage_path = bucketImage_path;
	}
	public int getSelectedbucket_id() {
		return selectedbucket_id;
	}
	public void setSelectedbucket_id(int selectedbucket_id) {
		this.selectedbucket_id = selectedbucket_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSb_content() {
		return sb_content;
	}
	public void setSb_content(String sb_content) {
		this.sb_content = sb_content;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getComplete_date() {
		return complete_date;
	}
	public void setComplete_date(String complete_date) {
		this.complete_date = complete_date;
	}
	public String getDi_content() {
		return di_content;
	}
	public void setDi_content(String di_content) {
		this.di_content = di_content;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public List<String> getTags() {
		return tags;
	}
	public void setTags(List<String> tags) {
		this.tags = tags;
	}
	@Override
	public String toString() {
		return "AchieveVO [bucketImage_path=" + bucketImage_path + ", selectedbucket_id=" + selectedbucket_id
				+ ", title=" + title + ", sb_content=" + sb_content + ", address=" + address + ", lat=" + lat + ", lng="
				+ lng + ", complete_date=" + complete_date + ", di_content=" + di_content + ", like_cnt=" + like_cnt
				+ ", age=" + age + ", tags=" + tags + "]";
	}
}

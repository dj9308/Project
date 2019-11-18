package vo;

import java.util.List;

public class InsertedBucketVO {
	private int bucket_id;
	private String title;
	private String content;
	private int group_id;
	private String d_day;
	private String member_id;
	private String address;
	private float lat;
	private float lng; 
	private String image_path;
	private List<String> tag_id;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getD_day() {
		return d_day;
	}
	public void setD_day(String d_day) {
		this.d_day = d_day;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public List<String> getTag_id() {
		return tag_id;
	}
	public void setTag_id(List<String> tag_id) {
		this.tag_id = tag_id;
	}
	@Override
	public String toString() {
		return "SelectedBucketVO [title=" + title + ", content=" + content + ", group_id=" + group_id + ", d_day="
				+ d_day + ", member_id=" + member_id + ", address=" + address + ", lat=" + lat + ", lng=" + lng
				+ ", image_path=" + image_path + ", tag_id=" + tag_id + "]";
	}
	public int getBucket_id() {
		return bucket_id;
	}
	public void setBucket_id(int bucket_id) {
		this.bucket_id = bucket_id;
	}

}

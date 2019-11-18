package vo;

import java.util.List;

public class UpdatedBucketVO {
	private int selectedbucket_id;
	private String member_id;
	private String title;
	private String content;
	private List<Integer> taglist;
	private int group_id;
	private String d_day;
	private String address;
	private float lat;
	private float lng;
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
	public List<Integer> getTaglist() {
		return taglist;
	}
	public void setTaglist(List<Integer> taglist) {
		this.taglist = taglist;
	}
	@Override
	public String toString() {
		return "UpdatedBucketVO [selectedbucket_id=" + selectedbucket_id + ", member_id=" + member_id + ", title=" + title
				+ ", content=" + content + ", taglist=" + taglist.size() + ", group_id=" + group_id + ", d_day=" + d_day
				+ ", address=" + address + ", lat=" + lat + ", lng=" + lng + "]";
	}
}

package vo;

import java.util.List;

public class EditBucketInfoVO {
	private int seletedbucket_id;
	private String member_id;
	private String title;
	private String image_path;
	private String content;
	private List<Integer> my_tags;
	private List<StringIntVO> tag_list;
	private List<StringIntVO> group_list;
	private int group_id;
	private String d_day;
	private float lat;
	private float lng;
	private String address;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<Integer> getMy_tags() {
		return my_tags;
	}
	public void setMy_tags(List<Integer> my_tags) {
		this.my_tags = my_tags;
	}
	public List<StringIntVO> getTag_list() {
		return tag_list;
	}
	public void setTag_list(List<StringIntVO> tag_list) {
		this.tag_list = tag_list;
	}
	public List<StringIntVO> getGroup_list() {
		return group_list;
	}
	public void setGroup_list(List<StringIntVO> group_list) {
		this.group_list = group_list;
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
	
	@Override
	public String toString() {
		return "EditBucketInfo [title=" + title + ", image_path=" + image_path + ", content=" + content + ", my_tags="
				+ my_tags + ", tag_list=" + tag_list + ", group_list=" + group_list + ", group_id=" + group_id
				+ ", d_day=" + d_day + ", lat=" + lat + ", lng=" + lng + "]";
	}
	public int getSeletedbucket_id() {
		return seletedbucket_id;
	}
	public void setSeletedbucket_id(int seletedbucket_id) {
		this.seletedbucket_id = seletedbucket_id;
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
	
}

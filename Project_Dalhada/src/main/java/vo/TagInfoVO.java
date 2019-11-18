package vo;

public class TagInfoVO {
	private int tag_id;
	private String name;
	private String videoUrl;
	
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	@Override
	public String toString() {
		return "TagInfoVO [tag_id=" + tag_id + ", name=" + name + ", videoUrl=" + videoUrl + "]";
	}
}

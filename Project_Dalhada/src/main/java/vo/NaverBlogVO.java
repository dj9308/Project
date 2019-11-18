package vo;

public class NaverBlogVO {
	private String title;
	private String link;
	private String description;
	private String postdate;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	@Override
	public String toString() {
		return "NaverBlogVO [title=" + title + ", link=" + link + ", description=" + description + ", postdate="
				+ postdate + "]";
	}
}

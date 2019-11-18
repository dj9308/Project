package vo;

public class SearchBucketVO {
	private String searchKeyword;
	private String searchTag;
	private int startRow;
    private int endRow;
    private String member_id;
    private String action;
    
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchTag() {
		return searchTag;
	}
	public void setSearchTag(String searchTag) {
		this.searchTag = searchTag;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "SearchBucketVO [searchKeyword=" + searchKeyword + ", searchTag=" + searchTag + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", member_id=" + member_id + "]";
	}
}
package vo;

public class LikeInfoVO {
	private String member_id;
	private int selectedbucket_id;
	private String action;
	
	public LikeInfoVO(String member_id, int selectedbucket_id) {
		setSelectedbucket_id(selectedbucket_id);
		setMember_id(member_id);
	}

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getSelectedbucket_id() {
		return selectedbucket_id;
	}
	public void setSelectedbucket_id(int selectedbucket_id) {
		this.selectedbucket_id = selectedbucket_id;
	}
	@Override
	public String toString() {
		return "BucketLikeVO [member_id=" + member_id + ", selectedbucket_id=" + selectedbucket_id + "]";
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
}

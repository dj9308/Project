package vo;

public class ReportVO {
	private String reason;
	private int report_id;
	private String report_mid;
	private String rcontent;
	private int review_id;
	private String review_mid;
	private String writedate;
	private String name; //festival name
	@Override
	public String toString() {
		return "ReportVO [reason=" + reason + ", report_id=" + report_id + ", report_mid=" + report_mid + ", rcontent="
				+ rcontent + ", review_mid=" + review_mid + ", writedate=" + writedate + ", name=" + name + "]";
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public String getReport_mid() {
		return report_mid;
	}
	public void setReport_mid(String report_mid) {
		this.report_mid = report_mid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getReview_mid() {
		return review_mid;
	}
	public void setReview_mid(String review_mid) {
		this.review_mid = review_mid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	
}

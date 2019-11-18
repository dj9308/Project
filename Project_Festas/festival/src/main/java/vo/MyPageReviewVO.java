package vo;

public class MyPageReviewVO {
private String name;
private String rcontent;
private int fid;
private String writedate;
private int grade;
private String mid;
private int review_id;


public int getReview_id() {
	return review_id;
}
public void setReview_id(int review_id) {
	this.review_id = review_id;
}
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRcontent() {
	return rcontent;
}
public void setRcontent(String rcontent) {
	this.rcontent = rcontent;
}
public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}
public String getWritedate() {
	return writedate;
}
public void setWritedate(String writedate) {
	this.writedate = writedate;
}
public int getGrade() {
	return grade;
}
public void setGrade(int grade) {
	this.grade = grade;
}


}

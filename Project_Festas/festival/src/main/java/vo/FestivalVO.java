package vo;

public class FestivalVO {
	private int fid;
	private String name;
	private float lat;
	private float lng;
	private String place;
	private String opendate;
	private String closedate;
	public String getOpendate() {
		return opendate;
	}
	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}
	public String getClosedate() {
		return closedate;
	}
	public void setClosedate(String closedate) {
		this.closedate = closedate;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
		return "FestivalVO [fid=" + fid + ", name=" + name + ", lat=" + lat + ", lng=" + lng + ", place=" + place
				+ ", opendate=" + opendate + ", closedate=" + closedate + "]";
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}

}
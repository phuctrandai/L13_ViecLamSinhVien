package bean;

public class TruongBean {
	
	private String matruong;
	private String tentruong;
	private String loaihinh;
	private String loaitruong;
	private String tinhthanhtructhuoc;
	private String diachi;
	private String sdt;
	private String sofax;
	private String email;
	private String website;
	
	
	public String getMatruong() {
		return matruong;
	}
	public void setMatruong(String matruong) {
		this.matruong = matruong;
	}
	public String getTentruong() {
		return tentruong;
	}
	public void setTentruong(String tentruong) {
		this.tentruong = tentruong;
	}
	public String getLoaihinh() {
		return loaihinh;
	}
	public void setLoaihinh(String loaihinh) {
		this.loaihinh = loaihinh;
	}
	public String getLoaitruong() {
		return loaitruong;
	}
	public void setLoaitruong(String loaitruong) {
		this.loaitruong = loaitruong;
	}
	
	public String getTinhthanhtructhuoc() {
		return tinhthanhtructhuoc;
	}
	public void setTinhthanhtructhuoc(String tinhthanhtructhuoc) {
		this.tinhthanhtructhuoc = tinhthanhtructhuoc;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getSofax() {
		return sofax;
	}
	public void setSofax(String sofax) {
		this.sofax = sofax;
	}
	public String getWebsite() {
		return website;
	}
	public TruongBean() {
		super();
	}
	public TruongBean(String matruong, String tentruong, String loaihinh, String loaitruong, String tinhthanhtructhuoc,
			String diachi, String sdt, String sofax, String email, String website) {
		super();
		this.matruong = matruong;
		this.tentruong = tentruong;
		this.loaihinh = loaihinh;
		this.loaitruong = loaitruong;
		this.tinhthanhtructhuoc = tinhthanhtructhuoc;
		this.diachi = diachi;
		this.sdt = sdt;
		this.sofax = sofax;
		this.email = email;
		this.website = website;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	
	
	
	
}

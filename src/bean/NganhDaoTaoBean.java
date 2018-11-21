package bean;

public class NganhDaoTaoBean {
	private String MaNganh;
	private String TenNganh;
	private String MaTruong;
	private String TrinhDoDT;
	private String HeDT;
	private String HinhThucDT;
	public String getMaNganh() {
		return MaNganh;
	}
	public void setMaNganh(String maNganh) {
		MaNganh = maNganh;
	}
	public String getTenNganh() {
		return TenNganh;
	}
	public void setTenNganh(String tenNganh) {
		TenNganh = tenNganh;
	}
	public String getMaTruong() {
		return MaTruong;
	}
	public void setMaTruong(String maTruong) {
		MaTruong = maTruong;
	}
	public String getTrinhDoDT() {
		return TrinhDoDT;
	}
	public void setTrinhDoDT(String trinhDoDT) {
		TrinhDoDT = trinhDoDT;
	}
	public String getHeDT() {
		return HeDT;
	}
	public void setHeDT(String heDT) {
		HeDT = heDT;
	}
	public String getHinhThucDT() {
		return HinhThucDT;
	}
	public void setHinhThucDT(String hinhThucDT) {
		HinhThucDT = hinhThucDT;
	}
	public NganhDaoTaoBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NganhDaoTaoBean(String maNganh, String tenNganh, String maTruong, String trinhDoDT, String heDT,
			String hinhThucDT) {
		super();
		MaNganh = maNganh;
		TenNganh = tenNganh;
		MaTruong = maTruong;
		TrinhDoDT = trinhDoDT;
		HeDT = heDT;
		HinhThucDT = hinhThucDT;
	}
	

}

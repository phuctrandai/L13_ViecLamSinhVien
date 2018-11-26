package bean;

public class QLTaiKhoanBean {
	private int MaTaiKhoan;
	private String TenTaiKhoan;
	private String MatKhau;
	private String LoaiTaiKhoan;
	private ThongTinTaiKhoanBean tt;
	public int getMaTaiKhoan() {
		return MaTaiKhoan;
	}
	public void setMaTaiKhoan(int maTaiKhoan) {
		MaTaiKhoan = maTaiKhoan;
	}
	public String getTenTaiKhoan() {
		return TenTaiKhoan;
	}
	public ThongTinTaiKhoanBean getTt() {
		return tt;
	}
	public void setTt(ThongTinTaiKhoanBean tt) {
		this.tt = tt;
	}
	public void setTenTaiKhoan(String tenTaiKhoan) {
		TenTaiKhoan = tenTaiKhoan;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public String getLoaiTaiKhoan() {
		return LoaiTaiKhoan;
	}
	public void setLoaiTaiKhoan(String loaiTaiKhoan) {
		LoaiTaiKhoan = loaiTaiKhoan;
	}
	
	public QLTaiKhoanBean(int maTaiKhoan, String tenTaiKhoan, String matKhau, String loaiTaiKhoan,
			ThongTinTaiKhoanBean tt) {
		super();
		MaTaiKhoan = maTaiKhoan;
		TenTaiKhoan = tenTaiKhoan;
		MatKhau = matKhau;
		LoaiTaiKhoan = loaiTaiKhoan;
		this.tt = tt;
	}
	public QLTaiKhoanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}

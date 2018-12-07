package bean;

public class TaiKhoanBean {
	
	private int maTaiKhoan;
	private String tenTaiKhoan;
	private String matKhau;
	private int maLoai;
	
	public int getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(int maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}

	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public int getLoaiTaiKhoan() {
		return maLoai;
	}

	public void setLoaiTaiKhoan(int maLoai) {
		this.maLoai = maLoai;
	}

	public TaiKhoanBean() {		
	}

	public TaiKhoanBean(int maTaiKhoan, String tenTaiKhoan, String matKhau, int maLoai) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.maLoai = maLoai;
	}
}

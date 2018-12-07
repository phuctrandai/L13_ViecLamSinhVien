package bean;

public class LoaiTaiKhoanBean {
	
	private int maLoai;
	private String tenLoai;
	
	public int getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(int maLoai) {
		this.maLoai = maLoai;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
	
	public LoaiTaiKhoanBean() {
		// TODO Auto-generated constructor stub
	}

	public LoaiTaiKhoanBean(int maLoai, String tenLoai) {
		super();
		this.maLoai = maLoai;
		this.tenLoai = tenLoai;
	}
}

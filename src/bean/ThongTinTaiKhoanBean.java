package bean;

import java.util.Date;

public class ThongTinTaiKhoanBean {
	private int MaTaiKhoan;
	private String HoVaTen;
	private Date NgaySinh;
	private String GioiTinh;
	private String CMND;
	private Date NgayCapCMND;
	private String NoiCap;
	private String DanToc;
	private String QuocTich;
	private String DiaChiThuongTru;
	private String SoDienThoai;
	private String Email;
	private String AnhDaiDien;
	public ThongTinTaiKhoanBean(int maTaiKhoan, String hoVaTen, Date ngaySinh, String gioiTinh, String cMND,
			Date ngayCapCMND, String noiCap, String danToc, String quocTich, String diaChiThuongTru, String soDienThoai,
			String email, String anhDaiDien) {
		super();
		MaTaiKhoan = maTaiKhoan;
		HoVaTen = hoVaTen;
		NgaySinh = ngaySinh;
		GioiTinh = gioiTinh;
		CMND = cMND;
		NgayCapCMND = ngayCapCMND;
		NoiCap = noiCap;
		DanToc = danToc;
		QuocTich = quocTich;
		DiaChiThuongTru = diaChiThuongTru;
		SoDienThoai = soDienThoai;
		Email = email;
		AnhDaiDien = anhDaiDien;
	}
	public int getMaTaiKhoan() {
		return MaTaiKhoan;
	}
	public void setMaTaiKhoan(int maTaiKhoan) {
		MaTaiKhoan = maTaiKhoan;
	}
	public String getHoVaTen() {
		return HoVaTen;
	}
	public void setHoVaTen(String hoVaTen) {
		HoVaTen = hoVaTen;
	}
	public Date getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		NgaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	public Date getNgayCapCMND() {
		return NgayCapCMND;
	}
	public void setNgayCapCMND(Date ngayCapCMND) {
		NgayCapCMND = ngayCapCMND;
	}
	public String getNoiCap() {
		return NoiCap;
	}
	public void setNoiCap(String noiCap) {
		NoiCap = noiCap;
	}
	public String getDanToc() {
		return DanToc;
	}
	public void setDanToc(String danToc) {
		DanToc = danToc;
	}
	public String getQuocTich() {
		return QuocTich;
	}
	public void setQuocTich(String quocTich) {
		QuocTich = quocTich;
	}
	public String getDiaChiThuongTru() {
		return DiaChiThuongTru;
	}
	public void setDiaChiThuongTru(String diaChiThuongTru) {
		DiaChiThuongTru = diaChiThuongTru;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAnhDaiDien() {
		return AnhDaiDien;
	}
	public void setAnhDaiDien(String anhDaiDien) {
		AnhDaiDien = anhDaiDien;
	}
	public ThongTinTaiKhoanBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}

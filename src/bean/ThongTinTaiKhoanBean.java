package bean;

import java.util.Date;

public class ThongTinTaiKhoanBean {

	public ThongTinTaiKhoanBean() {
		// TODO Auto-generated constructor stub
	}
	
	private String hoVaTen;
	private Date ngaySinh;
	private boolean gioiTinh;
	private String cMND;
	private Date ngayCapCMND;
	private String noiCapCMND;
	private String danToc;
	private String quocTich;
	private String diaChiThuongTru;
	private String soDienThoai;
	private String email;
	private String anhDaiDien;
	
	public String getHoVaTen() {
		return hoVaTen;
	}
	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public boolean isGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getcMND() {
		return cMND;
	}
	public void setcMND(String cMND) {
		this.cMND = cMND;
	}
	public Date getNgayCapCMND() {
		return ngayCapCMND;
	}
	public void setNgayCapCMND(Date ngayCapCMND) {
		this.ngayCapCMND = ngayCapCMND;
	}
	public String getNoiCapCMND() {
		return noiCapCMND;
	}
	public void setNoiCapCMND(String noiCapCMND) {
		this.noiCapCMND = noiCapCMND;
	}
	public String getDanToc() {
		return danToc;
	}
	public void setDanToc(String danToc) {
		this.danToc = danToc;
	}
	public String getQuocTich() {
		return quocTich;
	}
	public void setQuocTich(String quocTich) {
		this.quocTich = quocTich;
	}
	public String getDiaChiThuongTru() {
		return diaChiThuongTru;
	}
	public void setDiaChiThuongTru(String diaChiThuongTru) {
		this.diaChiThuongTru = diaChiThuongTru;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAnhDaiDien() {
		return anhDaiDien;
	}
	public void setAnhDaiDien(String anhDaiDien) {
		this.anhDaiDien = anhDaiDien;
	}
	public ThongTinTaiKhoanBean(String hoVaTen, Date ngaySinh, boolean gioiTinh, String cMND, Date ngayCapCMND,
			String noiCapCMND, String danToc, String quocTich, String diaChiThuongTru, String soDienThoai, String email,
			String anhDaiDien) {
		super();
		this.hoVaTen = hoVaTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.cMND = cMND;
		this.ngayCapCMND = ngayCapCMND;
		this.noiCapCMND = noiCapCMND;
		this.danToc = danToc;
		this.quocTich = quocTich;
		this.diaChiThuongTru = diaChiThuongTru;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.anhDaiDien = anhDaiDien;
	}
}

package bean;

import java.util.Date;

public class SinhVienBean {
	private int maSinhVien;
	private String tenTruong;
	private Date thoiGianTotNghiep;
	private String tenNganh;
	private String nienKhoa;
	private String soQuyetDinhTotNghiep;
	private Date ngayKyQuyetDinhTotNghiep;
	private ThongTinTaiKhoanBean thongTinTaiKhoan;
	private ThongTinViecLamBean thongTinViecLam;
	
	public int getMaSinhVien() {
		return maSinhVien;
	}
	public void setMaSinhVien(int maSinhVien) {
		this.maSinhVien = maSinhVien;
	}
	public String getTenTruong() {
		return tenTruong;
	}
	public void setTenTruong(String tenTruong) {
		this.tenTruong = tenTruong;
	}
	public Date getThoiGianTotNghiep() {
		return thoiGianTotNghiep;
	}
	public void setThoiGianTotNghiep(Date thoiGianTotNghiep) {
		this.thoiGianTotNghiep = thoiGianTotNghiep;
	}
	public String getTenNganh() {
		return tenNganh;
	}
	public void setTenNganh(String tenNganh) {
		this.tenNganh = tenNganh;
	}
	public String getNienKhoa() {
		return nienKhoa;
	}
	public void setNienKhoa(String nienKhoa) {
		this.nienKhoa = nienKhoa;
	}
	public String getSoQuyetDinhTotNghiep() {
		return soQuyetDinhTotNghiep;
	}
	public void setSoQuyetDinhTotNghiep(String soQuyetDinhTotNghiep) {
		this.soQuyetDinhTotNghiep = soQuyetDinhTotNghiep;
	}
	public Date getNgayKyQuyetDinhTotNghiep() {
		return ngayKyQuyetDinhTotNghiep;
	}
	public void setNgayKyQuyetDinhTotNghiep(Date ngayKyQuyetDinhTotNghiep) {
		this.ngayKyQuyetDinhTotNghiep = ngayKyQuyetDinhTotNghiep;
	}
	public ThongTinTaiKhoanBean getThongTinTaiKhoan() {
		return thongTinTaiKhoan;
	}
	public void setThongTinTaiKhoan(ThongTinTaiKhoanBean thongTinTaiKhoan) {
		this.thongTinTaiKhoan = thongTinTaiKhoan;
	}
	public ThongTinViecLamBean getThongTinViecLam() {
		return thongTinViecLam;
	}
	public void setThongTinViecLam(ThongTinViecLamBean thongTinViecLam) {
		this.thongTinViecLam = thongTinViecLam;
	}
	public SinhVienBean(int maSinhVien, String tenTruong, Date thoiGianTotNghiep, String tenNganh,
			String nienKhoa, String soQuyetDinhTotNghiep, Date ngayKyQuyetDinhTotNghiep,
			ThongTinTaiKhoanBean thongTinTaiKhoan, ThongTinViecLamBean thongTinViecLam) {
		super();
		this.maSinhVien = maSinhVien;
		this.tenTruong = tenTruong;
		this.thoiGianTotNghiep = thoiGianTotNghiep;
		this.tenNganh = tenNganh;
		this.nienKhoa = nienKhoa;
		this.soQuyetDinhTotNghiep = soQuyetDinhTotNghiep;
		this.ngayKyQuyetDinhTotNghiep = ngayKyQuyetDinhTotNghiep;
		this.thongTinTaiKhoan = thongTinTaiKhoan;
		this.thongTinViecLam = thongTinViecLam;
	}
	public SinhVienBean() {
		super();
	}
	
	
}

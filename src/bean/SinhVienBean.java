package bean;

import java.time.LocalDate;

public class SinhVienBean {
	private int maSinhVien;
	private String tenTruong;
	private LocalDate thoiGianTotNghiep;
	private String tenNganh;
	private String nienKhoa;
	private String soQuyetDinhTotNghiep;
	private LocalDate ngayKyQuyetDinhTotNghiep;
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
	public LocalDate getThoiGianTotNghiep() {
		return thoiGianTotNghiep;
	}
	public void setThoiGianTotNghiep(LocalDate thoiGianTotNghiep) {
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
	public LocalDate getNgayKyQuyetDinhTotNghiep() {
		return ngayKyQuyetDinhTotNghiep;
	}
	public void setNgayKyQuyetDinhTotNghiep(LocalDate ngayKyQuyetDinhTotNghiep) {
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
	public SinhVienBean(int maSinhVien, String tenTruong, LocalDate thoiGianTotNghiep, String tenNganh,
			String nienKhoa, String soQuyetDinhTotNghiep, LocalDate ngayKyQuyetDinhTotNghiep,
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

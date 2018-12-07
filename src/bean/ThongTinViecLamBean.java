package bean;

import java.time.LocalDate;

public class ThongTinViecLamBean {

	public ThongTinViecLamBean() {
		// TODO Auto-generated constructor stub
	}
	
	private String tenCongViec;
	private String viTriCongTac;
	private String tenCoQuan;
	private String diaChiCoQuan;
	private int loaiHinhCoQuan;
	private LocalDate thoiGianBatDauLamViec;
	private String mucDoPhuHopChuyenMon;
	private String mucDoDapUngKienThuc;
	private long mucThuNhapTBThang;
	
	public String getTenCongViec() {
		return tenCongViec;
	}
	public void setTenCongViec(String tenCongViec) {
		this.tenCongViec = tenCongViec;
	}
	public String getViTriCongTac() {
		return viTriCongTac;
	}
	public void setViTriCongTac(String viTriCongTac) {
		this.viTriCongTac = viTriCongTac;
	}
	public String getTenCoQuan() {
		return tenCoQuan;
	}
	public void setTenCoQuan(String tenCoQuan) {
		this.tenCoQuan = tenCoQuan;
	}
	public String getDiaChiCoQuan() {
		return diaChiCoQuan;
	}
	public void setDiaChiCoQuan(String diaChiCoQuan) {
		this.diaChiCoQuan = diaChiCoQuan;
	}
	public int getLoaiHinhCoQuan() {
		return loaiHinhCoQuan;
	}
	public void setLoaiHinhCoQuan(int loaiHinhCoQuan) {
		this.loaiHinhCoQuan = loaiHinhCoQuan;
	}
	public LocalDate getThoiGianBatDauLamViec() {
		return thoiGianBatDauLamViec;
	}
	public void setThoiGianBatDauLamViec(LocalDate thoiGianBatDauLamViec) {
		this.thoiGianBatDauLamViec = thoiGianBatDauLamViec;
	}
	public String getMucDoPhuHopChuyenMon() {
		return mucDoPhuHopChuyenMon;
	}
	public void setMucDoPhuHopChuyenMon(String mucDoPhuHopChuyenMon) {
		this.mucDoPhuHopChuyenMon = mucDoPhuHopChuyenMon;
	}
	public String getMucDoDapUngKienThuc() {
		return mucDoDapUngKienThuc;
	}
	public void setMucDoDapUngKienThuc(String mucDoDapUngKienThuc) {
		this.mucDoDapUngKienThuc = mucDoDapUngKienThuc;
	}
	public long getMucThuNhapTBThang() {
		return mucThuNhapTBThang;
	}
	public void setMucThuNhapTBThang(long mucThuNhapTBThang) {
		this.mucThuNhapTBThang = mucThuNhapTBThang;
	}
	public ThongTinViecLamBean(String tenCongViec, String viTriCongTac, String tenCoQuan, String diaChiCoQuan,
			int loaiHinhCoQuan, LocalDate thoiGianBatDauLamViec, String mucDoPhuHopChuyenMon, String mucDoDapUngKienThuc,
			long mucThuNhapTBThang) {
		super();
		this.tenCongViec = tenCongViec;
		this.viTriCongTac = viTriCongTac;
		this.tenCoQuan = tenCoQuan;
		this.diaChiCoQuan = diaChiCoQuan;
		this.loaiHinhCoQuan = loaiHinhCoQuan;
		this.thoiGianBatDauLamViec = thoiGianBatDauLamViec;
		this.mucDoPhuHopChuyenMon = mucDoPhuHopChuyenMon;
		this.mucDoDapUngKienThuc = mucDoDapUngKienThuc;
		this.mucThuNhapTBThang = mucThuNhapTBThang;
	}
}

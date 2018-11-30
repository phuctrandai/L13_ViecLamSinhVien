package bo;

import java.sql.SQLException;

import bean.SinhVienBean;
import bean.ThongTinViecLamBean;
import dao.SinhVienDao;

public class SinhVienBo {

	public SinhVienBo() {
		// TODO Auto-generated constructor stub
	}
	
	public SinhVienBean GetSinhVienTheoTaiKhoan(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		SinhVienDao svd = new SinhVienDao();
		return svd.GetSinhVienTheoTaiKhoan(maTaiKhoan);
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, ThongTinViecLamBean thongTin) throws ClassNotFoundException, SQLException {
		SinhVienDao svd = new SinhVienDao();
		return svd.UpdateThongTinViecLam(maSinhVien, thongTin);
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, boolean isThatNghiep) throws ClassNotFoundException, SQLException {
		SinhVienDao svd = new SinhVienDao();
		return svd.UpdateThongTinViecLam(maSinhVien, isThatNghiep);
	}
}

package bo;

import java.sql.SQLException;

import bean.SinhVienBean;
import dao.SinhVienDao;

public class SinhVienBo {

	public SinhVienBo() {
		// TODO Auto-generated constructor stub
	}
	
	public SinhVienBean GetSinhVienTheoTaiKhoan(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		SinhVienDao svd = new SinhVienDao();
		return svd.GetSinhVienTheoTaiKhoan(maTaiKhoan);
	}
}

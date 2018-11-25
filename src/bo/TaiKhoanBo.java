package bo;

import java.sql.SQLException;

import bean.TaiKhoanBean;
import dao.TaiKhoanDao;

public class TaiKhoanBo {
	
	private TaiKhoanDao taiKhoanDao;
	
	public TaiKhoanBo() { taiKhoanDao = new TaiKhoanDao(); }
	
	public TaiKhoanBean getTaiKhoan(String tenTaiKhoan, String matKhau, String loaiTaiKhoan) throws ClassNotFoundException, SQLException {
		TaiKhoanBean taiKhoan = taiKhoanDao.getTaiKhoan(tenTaiKhoan, matKhau, loaiTaiKhoan);
		return taiKhoan;		
	}

}

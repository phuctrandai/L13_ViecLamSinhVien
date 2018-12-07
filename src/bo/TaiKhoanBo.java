package bo;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.LoaiTaiKhoanBean;
import bean.TaiKhoanBean;
import bean.ThongTinTaiKhoanBean;
import dao.TaiKhoanDao;

public class TaiKhoanBo {
	
	private TaiKhoanDao taiKhoanDao;
	
	public TaiKhoanBo() { taiKhoanDao = new TaiKhoanDao(); }
	
	public TaiKhoanBean getTaiKhoan(String tenTaiKhoan, String matKhau, int maLoai) throws ClassNotFoundException, SQLException {
		TaiKhoanBean taiKhoan = taiKhoanDao.getTaiKhoan(tenTaiKhoan, matKhau, maLoai);
		return taiKhoan;		
	}
	
	public int UpdateThongTinTaiKhoan(int maSinhVien, ThongTinTaiKhoanBean thongTin) throws ClassNotFoundException, SQLException {
		int maTaiKhoan = taiKhoanDao.GetMaTaiKhoan(maSinhVien);
		return taiKhoanDao.UpdateThongTinTaiKhoan(maTaiKhoan, thongTin);
	}
	
	public ArrayList<LoaiTaiKhoanBean> getListLoai() throws ClassNotFoundException, SQLException {
		return taiKhoanDao.getListLoai();
	}
}

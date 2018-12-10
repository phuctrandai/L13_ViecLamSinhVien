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
	
	public ArrayList<TaiKhoanBean> GetListTaiKhoan() throws ClassNotFoundException, SQLException {
		return taiKhoanDao.GetListTaiKhoan();
	}
	
	public ArrayList<ThongTinTaiKhoanBean> GetListThongTinTaiKhoan(ArrayList<TaiKhoanBean> list) throws ClassNotFoundException, SQLException {
		ArrayList<ThongTinTaiKhoanBean> result = new ArrayList<>();
		for(TaiKhoanBean tk : list) {
			ThongTinTaiKhoanBean tt = taiKhoanDao.GetThongTin(tk.getMaTaiKhoan());
			
			result.add(tt);
		}
		return result;
	}
	
	public int XoaTaiKhoan(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		return taiKhoanDao.XoaTaiKhoan(maTaiKhoan);
	}
	
	/*
	 * Doi mat khau
	 */
	public int DoiMatKhau(int maTaiKhoan, String matKhauMoi) throws ClassNotFoundException, SQLException {
		return taiKhoanDao.DoiMatKhau(maTaiKhoan, matKhauMoi);
	}
	
	public boolean CheckMatKhau(String matKhau) throws ClassNotFoundException, SQLException {
		if(matKhau == null) return false;
		return taiKhoanDao.CheckMatKhau(matKhau);
	}
}

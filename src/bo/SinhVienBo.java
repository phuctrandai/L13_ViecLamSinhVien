package bo;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import bean.DaoTaoNangCaoBean;
import bean.LoaiHinhCoQuanBean;
import bean.SinhVienBean;
import bean.ThongTinViecLamBean;
import dao.SinhVienDao;

public class SinhVienBo {

	public SinhVienBo() {
		svd = new SinhVienDao();
	}
	
	private SinhVienDao svd;
	
	public SinhVienBean GetSinhVienTheoTaiKhoan(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		return svd.GetSinhVienTheoTaiKhoan(maTaiKhoan);
	}
	
	public int UpdateThongTinDaoTao(int maSinhVien, String maTruong, String maNganh, String nienKhoa, LocalDate thoiGianTotNghiep, String soQuyetDinh, LocalDate ngayKyQuyetDinh) throws ClassNotFoundException, SQLException {
		return svd.UpdateThongTinDaoTao(maSinhVien, maTruong, maNganh, nienKhoa, thoiGianTotNghiep, soQuyetDinh, ngayKyQuyetDinh);
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, ThongTinViecLamBean thongTin) throws ClassNotFoundException, SQLException {
		return svd.UpdateThongTinViecLam(maSinhVien, thongTin);
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, boolean isThatNghiep) throws ClassNotFoundException, SQLException {
		return svd.UpdateThongTinViecLam(maSinhVien, isThatNghiep);
	}
	
	public ArrayList<LoaiHinhCoQuanBean> getListLoaiHinh() throws ClassNotFoundException, SQLException {
		return svd.getListLoaiHinhCoQuan();
	}
	
	public String getTenLoaiHinhCoQuan(int maLoai) throws ClassNotFoundException, SQLException {
		return svd.getTenLoaiHinhCoQuan(maLoai);
	}
	
	public int UpdateThongTinDaoTaoNangCao(int maSinhVien, DaoTaoNangCaoBean daoTao) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		if(svd.GetThongTinDaoTaoNangCao(maSinhVien) == null) {
			rowEffect = svd.InsertThongTinDaoTaoNangCao(maSinhVien, daoTao);
		}
		else {
			rowEffect = svd.UpdateThongTinDaoTaoNangCao(maSinhVien, daoTao);
		}
		return rowEffect;
	}
}

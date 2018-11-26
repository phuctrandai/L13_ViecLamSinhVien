package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.TaiKhoanBean;
import bean.ThongTinTaiKhoanBean;

public class TaiKhoanDao {

	public TaiKhoanDao() { }
	
	public TaiKhoanBean getTaiKhoan(String tenTaiKhoan, String matKhau, String loaiTaiKhoan) throws ClassNotFoundException, SQLException {
		TaiKhoanBean taiKhoan = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "select * from TaiKhoan where TenTaiKhoan = ? and MatKhau = ? and LoaiTaiKhoan = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { tenTaiKhoan, matKhau, loaiTaiKhoan });
		if(resultSet.next()) {
			int maTaiKhoan = resultSet.getInt("MaTaiKhoan");
			taiKhoan = new TaiKhoanBean(maTaiKhoan, tenTaiKhoan, matKhau, loaiTaiKhoan);
		}
		resultSet.close();
		connectDB.Disconnect();
		return taiKhoan;
	}
	
	public ThongTinTaiKhoanBean GetThongTin(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		ThongTinTaiKhoanBean tk = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "select * from ThongTinTaiKhoan where MaTaiKhoan = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { maTaiKhoan });
		if(resultSet.next()) {
			tk = new ThongTinTaiKhoanBean();
			tk.setAnhDaiDien(resultSet.getString("AnhDaiDien"));
			tk.setcMND(resultSet.getString("CMND"));
			tk.setDanToc(resultSet.getString("DanToc"));
			tk.setDiaChiThuongTru(resultSet.getString("DiaChiThuongTru"));
			tk.setEmail(resultSet.getString("Email"));
			tk.setGioiTinh(resultSet.getBoolean("GioiTinh"));
			tk.setHoVaTen(resultSet.getString("HoVaTen"));
			tk.setNgayCapCMND(resultSet.getDate("NgayCapCMND").toLocalDate());
			tk.setNgaySinh(resultSet.getDate("NgaySinh").toLocalDate());
			tk.setNoiCapCMND(resultSet.getString("NoiCapCMND"));
			tk.setQuocTich(resultSet.getString("QuocTich"));
			tk.setSoDienThoai(resultSet.getString("SoDienThoai"));
		}
		resultSet.close();
		connectDB.Disconnect();
		return tk;
	}

}

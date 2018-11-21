package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.TaiKhoanBean;

public class TaiKhoanDao {

	public TaiKhoanDao() { }
	
	public TaiKhoanBean getTaiKhoan(String tenTaiKhoan, String matKhau) throws ClassNotFoundException, SQLException {
		TaiKhoanBean taiKhoan = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "select * from TaiKhoan where TenTaiKhoan = ? and MatKhau = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { tenTaiKhoan, matKhau });
		if(resultSet.next()) {
			int maTaiKhoan = resultSet.getInt("MaTaiKhoan");
			String loaiTaiKhoan = resultSet.getString("LoaiTaiKhoan");
			taiKhoan = new TaiKhoanBean(maTaiKhoan, tenTaiKhoan, matKhau, loaiTaiKhoan);
		}
		return taiKhoan;
	}

}

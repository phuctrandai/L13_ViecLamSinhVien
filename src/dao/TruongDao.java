package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.TruongBean;

public class TruongDao {

	public int KhaiBaoTruong(String matruong, String tentruong, String loaihinh, String loaitruong,
			String tinhthanhtructhuoc, String diachi, String sdt, String sofax, String email, String website)
			throws Exception {
		String sql = "insert into TRUONG(matruong,tentruong,loaihinh,loaitruong,tinhthanhtructhuoc, diachi,SoDienThoai,sofax,email,website)"
				+ " values(?,?,?,?,?,?,?,?,?,?)";
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		int kq = connectDB.executeUpdate(sql, new Object[] {
				matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc
				, diachi, sdt, sofax, email, website
		});
		connectDB.Disconnect();
		return kq;

	}

	public int ChinhSuaTruong(String matruong, String tentruong, String loaihinh, String loaitruong,
			String tinhthanhtructhuoc, String diachi, String sdt, String sofax, String email, String website)
			throws Exception {
		String sql = "update TRUONG set TenTruong=?,LoaiHinh=?,LoaiTruong=?,"
				+ "TinhThanhTrucThuoc=?,DiaChi=?,SoDienThoai=?,SoFax=?,Email=?,Website=? "
				+ "where MaTruong=?";
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		int kq = connectDB.executeUpdate(sql, new Object[] {
					tentruong, loaihinh, loaitruong, tinhthanhtructhuoc
				, diachi, sdt, sofax, email, website, matruong
		});
		connectDB.Disconnect();
		return kq;
	}

	public ArrayList<TruongBean> GetDanhSach() throws ClassNotFoundException, SQLException {
		ArrayList<TruongBean> list = new ArrayList<>();

		String query = "SELECT * FROM TRUONG";
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();

		ResultSet resultSet = connectDB.executeQuery(query, null);
		while (resultSet.next()) {
			TruongBean truong = new TruongBean();
			truong.setMatruong(resultSet.getString("MaTruong"));
			truong.setTentruong(resultSet.getString("TenTruong"));
			truong.setDiachi(resultSet.getString("DiaChi"));
			truong.setEmail(resultSet.getString("Email"));
			truong.setLoaihinh(resultSet.getString("LoaiHinh"));
			truong.setLoaitruong(resultSet.getString("LoaiTruong"));
			truong.setSdt(resultSet.getString("SoDienThoai"));
			truong.setSofax(resultSet.getString("SoFax"));
			truong.setWebsite(resultSet.getString("Website"));
			truong.setTinhthanhtructhuoc(resultSet.getString("TinhThanhTrucThuoc"));
			list.add(truong);
		}
		resultSet.close();
		connectDB.Disconnect();
		return list;
	}

	public int XoaTruong(String maTruong) throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();

		String query = "DELETE FROM TRUONG WHERE MaTruong = ?";
		int rowEffect = connectDB.executeUpdate(query, new Object[] { maTruong });

		connectDB.Disconnect();
		return rowEffect;
	}

	public TruongBean TimTheoMa(String maTruong) throws Exception {
		String sql = "select * from TRUONG where MaTruong = ? ";
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();

		ResultSet rs = connectDB.executeQuery(sql, new Object[] { maTruong });
		TruongBean truong = null;
		if (rs.next()) {// duyet qua tap du lieu
			 truong = new TruongBean(rs.getString("MaTruong"), rs.getString("TenTruong"),
					rs.getString("LoaiHinh"), rs.getString("LoaiTruong"), rs.getString("TinhThanhTrucThuoc"),
					rs.getString("DiaChi"), rs.getString("SoDienThoai"), rs.getString("SoFax"), rs.getString("Email"),
					rs.getString("Website"));
		}
		rs.close();// Dong RESULTSET
		connectDB.Disconnect();// Dong RESULTSET
		return truong;// tra ve ds
	}
}

package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.LoaiTaiKhoanBean;
import bean.TaiKhoanBean;
import bean.ThongTinTaiKhoanBean;

public class TaiKhoanDao {

	public TaiKhoanDao() { }
	
	public TaiKhoanBean getTaiKhoan(String tenTaiKhoan, String matKhau, int maLoai) throws ClassNotFoundException, SQLException {
		TaiKhoanBean taiKhoan = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "select * from TaiKhoan where TenTaiKhoan = ? and MatKhau = ? and MaLoai = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { tenTaiKhoan, matKhau, maLoai });
		if(resultSet.next()) {
			int maTaiKhoan = resultSet.getInt("MaTaiKhoan");
			taiKhoan = new TaiKhoanBean(maTaiKhoan, tenTaiKhoan, matKhau, maLoai);
		}
		resultSet.close();
		connectDB.Disconnect();
		return taiKhoan;
	}
		
	public ThongTinTaiKhoanBean GetThongTin(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		ThongTinTaiKhoanBean tk = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "select * from THONGTINTAIKHOAN where MaTaiKhoan = ?";
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
	
	public int InsertThongTinTaiKhoan(int maTaiKhoan, ThongTinTaiKhoanBean thongTin) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "INSERT INTO THONGTINTAIKHOAN("
				+ "MaTaiKhoan, "
				+ "HoVaTen, "
				+ "NgaySinh,"
				+ " GioiTinh, "
				+ "CMND, "
				+ "NgayCapCMND, "
				+ "NoiCapCMND, "
				+ "DanToc, "
				+ "QuocTich, "
				+ "DiaChiThuongTru, "
				+ "SoDienThoai, "
				+ "Email, "
				+ "AnhDaiDien)\r\n" + 
				"VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		rowEffect = connectDB.executeUpdate(query, new Object[] {
				maTaiKhoan,
				thongTin.getHoVaTen(),
				Date.valueOf(thongTin.getNgaySinh()),
				thongTin.isGioiTinh(),
				thongTin.getcMND(),
				Date.valueOf(thongTin.getNgayCapCMND()),
				thongTin.getNoiCapCMND(),
				thongTin.getDanToc(),
				thongTin.getQuocTich(),
				thongTin.getDiaChiThuongTru(),
				thongTin.getSoDienThoai(),
				thongTin.getEmail(),
				thongTin.getAnhDaiDien()
		});
		connectDB.Disconnect();
		
		return rowEffect;
	}

	public int UpdateThongTinTaiKhoan(int maTaiKhoan, ThongTinTaiKhoanBean thongTin) throws ClassNotFoundException, SQLException {
		if(GetThongTin(maTaiKhoan) == null) {
			int rowEffect = InsertThongTinTaiKhoan(maTaiKhoan, thongTin);
			System.out.println("TaiKhoanDao - Insert thong tin tai khoan - RowEff = " + rowEffect);
			return rowEffect;
		}
		int rowEffect = 0;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "UPDATE THONGTINTAIKHOAN\r\n" + 
				"SET HoVaTen = ?, "
				+ "NgaySinh = ?, "
				+ "GioiTinh = ?, "
				+ "CMND = ?, "
				+ "NgayCapCMND = ?, "
				+ "NoiCapCMND = ?, "
				+ "DanToc = ?, "
				+ "QuocTich = ?, "
				+ "DiaChiThuongTru = ?, "
				+ "SoDienThoai = ?, "
				+ "Email = ?, "
				+ "AnhDaiDien = ?\r\n" + 
				"WHERE(MaTaiKhoan = ?)";
		
		rowEffect = connectDB.executeUpdate(query, new Object[] {
				thongTin.getHoVaTen(),
				Date.valueOf(thongTin.getNgaySinh()),
				thongTin.isGioiTinh(),
				thongTin.getcMND(),
				Date.valueOf(thongTin.getNgayCapCMND()),
				thongTin.getNoiCapCMND(),
				thongTin.getDanToc(),
				thongTin.getQuocTich(),
				thongTin.getDiaChiThuongTru(),
				thongTin.getSoDienThoai(),
				thongTin.getEmail(),
				thongTin.getAnhDaiDien(),
				maTaiKhoan
		});
		connectDB.Disconnect();
		System.out.println("TaiKhoanDao - Update thong tin tai khoan - RowEff = " + rowEffect );
		return rowEffect;
	}
	
	public int GetMaTaiKhoan(int maSinhVien) throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT MaTaiKhoan FROM SINHVIEN WHERE MaSinhVien = ?";
		Object rs = connectDB.executeScalar(query, new Object[] { maSinhVien });
		
		return (Integer.parseInt(rs.toString()));
	}
	
	public ArrayList<LoaiTaiKhoanBean> getListLoai() throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		ArrayList<LoaiTaiKhoanBean> list = new ArrayList<>();
		
		String query = "SELECT * FROM LOAITAIKHOAN";
		ResultSet rs = connectDB.executeQuery(query, null);
		while(rs.next()) {
			list.add(new LoaiTaiKhoanBean(rs.getInt("MaLoai"), rs.getString("TenLoai")));
		}
		rs.close();
		connectDB.Disconnect();
		return list;
	}
	
	public ArrayList<TaiKhoanBean> GetListTaiKhoan() throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		ArrayList<TaiKhoanBean> list = new ArrayList<>();
		
		String query = "SELECT TAIKHOAN.*, TenLoai FROM TAIKHOAN JOIN LOAITAIKHOAN ON TAIKHOAN.MaLoai = LOAITAIKHOAN.MaLoai";
		ResultSet rs = connectDB.executeQuery(query, null);
		while(rs.next()) {
			TaiKhoanBean tk = new TaiKhoanBean(rs.getInt("MaTaiKhoan"), rs.getString("TenTaiKhoan"), rs.getString("MatKhau"), rs.getInt("MaLoai"));
			tk.setTenLoai(rs.getString("TenLoai"));
			list.add(tk);
		}
		rs.close();
		connectDB.Disconnect();
		System.out.println("TaiKhoanDao - Get list tai khoan - RE: " + list.size());
		return list;
	}
	
	public int XoaTaiKhoan(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "DELETE FROM TAIKHOAN WHERE MaTaiKhoan = ?";
		rowEffect = connectDB.executeUpdate(query, new Object[] { maTaiKhoan });
		
		connectDB.Disconnect();
		System.out.println("TaiKhoanDao - Xoa tai khoan " + maTaiKhoan + " - RE: " + rowEffect);
		return rowEffect;
	}
	
	/*
	 * Doi mat khau
	 */
	public boolean CheckMatKhau(String matKhau) throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		boolean result = false;
		String query = "SELECT * FROM TAIKHOAN WHERE MatKhau = ?";
		ResultSet rs = connectDB.executeQuery(query, new Object[] { matKhau });
		if(rs.next()) {
			result = true;
		}
		rs.close();
		connectDB.Disconnect();
		return result;
	}
	
	public int DoiMatKhau(int maTaiKhoan, String matKhauMoi) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "UPDATE TAIKHOAN SET MatKhau = ? WHERE MaTaiKhoan = ?";
		rowEffect = connectDB.executeUpdate(query, new Object[] { matKhauMoi, maTaiKhoan });
		
		connectDB.Disconnect();
		return rowEffect;
	}
}

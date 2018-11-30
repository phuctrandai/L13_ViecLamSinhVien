package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Formatter;

import bean.SinhVienBean;
import bean.ThongTinTaiKhoanBean;
import bean.ThongTinViecLamBean;


public class SinhVienDao {
	
	public ArrayList<SinhVienBean> GetDanhSach() throws Exception {
		ArrayList<SinhVienBean> listSinhVien = new ArrayList<SinhVienBean>();
				
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT * FROM vThongTinSinhVien";
		ResultSet resultSet = connectDB.executeQuery(query, null);
		while(resultSet.next()) {
			SinhVienBean sv = new SinhVienBean();			
			ThongTinTaiKhoanBean tk = new ThongTinTaiKhoanBean();
			
			sv.setThongTinTaiKhoan(tk);
			
			sv.setThongTinViecLam(GetThongTinViecLam(resultSet.getInt("MaSinhVien")));
			
			listSinhVien.add(sv);
		}
		resultSet.close();
		connectDB.Disconnect();
		return listSinhVien;
	}
	
	public SinhVienBean GetSinhVien(int maSinhVien) throws ClassNotFoundException, SQLException {
		SinhVienBean sv = new SinhVienBean();
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT * FROM SinhVien WHERE ThongTinTaiKhoan = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { maSinhVien });
		
		if (resultSet.next()) {
			sv.setMaSinhVien(resultSet.getInt("MaSinhVien"));
			sv.setTenNganh(resultSet.getString("TenNganh"));
			sv.setNgayKyQuyetDinhTotNghiep(resultSet.getDate("NgayKyQuyetDinhTotNghiep").toLocalDate());
			sv.setNienKhoa(resultSet.getString("NienKhoa"));
			sv.setSoQuyetDinhTotNghiep(resultSet.getString("SoQuyetDinhTotNghiep"));
			sv.setTenTruong(resultSet.getString("TenTruong"));
			sv.setThoiGianTotNghiep(resultSet.getDate("ThoiGianTotNghiep").toLocalDate());
		}
		resultSet.close();
		connectDB.Disconnect();
		return sv;
	}
	
	public SinhVienBean GetSinhVienTheoTaiKhoan(int maTaiKhoan) throws ClassNotFoundException, SQLException {
		SinhVienBean sv = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		// Thong tin sinh vien ( thong tin dao tao )
		String query = "SELECT SINHVIEN.MaSinhVien, SINHVIEN.NienKhoa, SINHVIEN.ThoiGianTotNghiep, SINHVIEN.SoQuyetDinhTotNghiep, SINHVIEN.NgayKyQuyetDinhTotNghiep, TRUONG.TenTruong, NGANHDAOTAO.TenNganh\r\n" + 
				"FROM NGANHDAOTAO INNER JOIN\r\n" + 
				"TRUONG_NGANH ON NGANHDAOTAO.MaNganh = TRUONG_NGANH.MaNganh INNER JOIN\r\n" + 
				"TRUONG ON TRUONG_NGANH.MaTruong = TRUONG.MaTruong RIGHT OUTER JOIN\r\n" + 
				"SINHVIEN ON TRUONG_NGANH.MaTruongNganh = SINHVIEN.MaTruongNganh WHERE MaTaiKhoan = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { maTaiKhoan });
		
		if(resultSet.next()) {
			sv = new SinhVienBean();
			sv.setMaSinhVien(resultSet.getInt("MaSinhVien"));
			sv.setTenNganh(resultSet.getString("TenNganh"));
			sv.setNgayKyQuyetDinhTotNghiep(resultSet.getDate("NgayKyQuyetDinhTotNghiep").toLocalDate());
			sv.setNienKhoa(resultSet.getString("NienKhoa"));
			sv.setSoQuyetDinhTotNghiep(resultSet.getString("SoQuyetDinhTotNghiep"));
			sv.setTenTruong(resultSet.getString("TenTruong"));
			sv.setThoiGianTotNghiep(resultSet.getDate("ThoiGianTotNghiep").toLocalDate());
			
			TaiKhoanDao taiKhoanDao = new TaiKhoanDao();
			ThongTinTaiKhoanBean tk = taiKhoanDao.GetThongTin(maTaiKhoan);
			sv.setThongTinTaiKhoan(tk);
			sv.setThongTinViecLam(this.GetThongTinViecLam(resultSet.getInt("MaSinhVien")));
		}
		resultSet.close();
		connectDB.Disconnect();
		return sv;
	}
	
	public ThongTinViecLamBean GetThongTinViecLam(int maSinhVien) throws ClassNotFoundException, SQLException {
		ThongTinViecLamBean vl = null;
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT * FROM ThongTinViecLam WHERE MaSinhVien = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { maSinhVien });
		if (resultSet.next()) {
			vl = new ThongTinViecLamBean();
			vl.setDiaChiCoQuan(resultSet.getString("DiaChiCoQuan"));
			vl.setLoaiHinhCoQuan(resultSet.getString("LoaiHinhCoQuan"));
			vl.setMucDoDapUngKienThuc(resultSet.getString("MucDoDapUngKTCM"));
			vl.setMucDoPhuHopChuyenMon(resultSet.getString("MucDoPhuHopChuyenMon"));
			vl.setMucThuNhapTBThang(resultSet.getLong("MucThuNhapTBThang"));
			vl.setTenCongViec(resultSet.getString("TenCongViec"));
			vl.setTenCoQuan(resultSet.getString("TenCoQuan"));
			vl.setThoiGianBatDauLamViec(resultSet.getDate("ThoiGianBatDauLamViec").toLocalDate());
			vl.setViTriCongTac(resultSet.getString("ViTriCongTac"));
		}
		resultSet.close();
		connectDB.Disconnect();
		return vl;
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, ThongTinViecLamBean thongTin) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT MaSinhVien FROM THONGTINVIECLAM WHERE MaSinhVien = ?";
		ResultSet rs = connectDB.executeQuery(query, new Object[] { maSinhVien });
		// Neu chua co thi insert vao
		if(!rs.next()) {
			query = "INSERT INTO THONGTINVIECLAM "
					+ "(MaSinhVien, TenCongViec, ThoiGianBatDauLamViec, TenCoQuan, DiaChiCoQuan, LoaiHinhCoQuan, ViTriCongTac, MucThuNhapTBThang, MucDoPhuHopChuyenMon, MucDoDapUngKTCM)\r\n" + 
					"VALUES(?,?,?,?,?,?,?,?,?,?)";
			rowEffect = connectDB.executeUpdate(query, new Object[] {
					maSinhVien, 
					thongTin.getTenCongViec(), 
					Date.valueOf(thongTin.getThoiGianBatDauLamViec()),
					thongTin.getTenCoQuan(), 
					thongTin.getDiaChiCoQuan(), 
					thongTin.getLoaiHinhCoQuan(),
					thongTin.getViTriCongTac(), 
					thongTin.getMucThuNhapTBThang(), 
					thongTin.getMucDoPhuHopChuyenMon(),
					thongTin.getMucDoDapUngKienThuc()
			});
			System.out.println("Isert thong tin viec lam");
		}
		else {
			query = "UPDATE THONGTINVIECLAM\r\n" + 
					"SET TenCongViec = ?, ThoiGianBatDauLamViec = ?, "
					+ "TenCoQuan = ?, DiaChiCoQuan = ?, LoaiHinhCoQuan = ?, ViTriCongTac = ?, "
					+ "MucThuNhapTBThang = ? , MucDoPhuHopChuyenMon = ?, MucDoDapUngKTCM = ? \r\n" + 
					"WHERE(MaSinhVien = ?)";
			rowEffect = connectDB.executeUpdate(query, new Object[] {
					thongTin.getTenCongViec(), 
					Date.valueOf(thongTin.getThoiGianBatDauLamViec()),
					thongTin.getTenCoQuan(), 
					thongTin.getDiaChiCoQuan(), 
					thongTin.getLoaiHinhCoQuan(),
					thongTin.getViTriCongTac(), 
					thongTin.getMucThuNhapTBThang(), 
					thongTin.getMucDoPhuHopChuyenMon(), 
					thongTin.getMucDoDapUngKienThuc(),
					maSinhVien
			});
			System.out.println("Update thong tin viec lam");
		}
		rs.close();
		connectDB.Disconnect();
		return rowEffect;
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, boolean isThatNghiep) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		if(isThatNghiep) {
			ConnectDB connectDB = new ConnectDB();
			connectDB.Connect();
			String query = "DELETE FROM THONGTINVIECLAM WHERE MaSinhVien = ?";
			rowEffect = connectDB.executeUpdate(query, new Object[] { maSinhVien });
			connectDB.Disconnect();
		}
		return rowEffect;
	}
	
	

	/*public int Themsv( String nienkhoa, Date thoigiantotnghiep, String soquyetdinhtn, Date ngayki
			) throws Exception {
		coso cs = new coso();
		cs.ketnoi();
		String sql = "insert into SINHVIEN(NienKhoa,ThoiGianTotNghiep,SoQuyetDinhTotNghiep,NgayKyQuyetDinhTotNghiep) values(?,?,?,?)";
		PreparedStatement stm = cs.con.prepareStatement(sql);
		//stm.setString(1, masv);
		stm.setString(1, nienkhoa);
		stm.setDate(2, new java.sql.Date(thoigiantotnghiep.getTime()));
		stm.setString(3, soquyetdinhtn);
		stm.setDate(4, new java.sql.Date(ngayki.getTime()));
		//stm.setString(6, matk);
		//stm.setString(7, matruongnganh);
		int kq = stm.executeUpdate();
		cs.con.close();
		return kq;

	}
	public int Suasv( String nienkhoa, Date thoigiantotnghiep, String soquyetdinhtn, Date ngayki) throws Exception 
	{
		coso cs=new coso();
		cs.ketnoi();
		String sql="update SINHVIEN set ThoiGianTotNghiep=?,SoQuyetDinhTotNghiep=?,NgayKiQuyetDinhTotNghiep=? where NienKhoa=?";
		PreparedStatement stm = cs.con.prepareStatement(sql);
		stm.setString(4, nienkhoa);
		stm.setDate(1, new java.sql.Date(thoigiantotnghiep.getTime()));
		stm.setString(2, soquyetdinhtn);
		stm.setDate(3, new java.sql.Date(ngayki.getTime()));
        int kq = stm.executeUpdate();
		cs.con.close();
		return kq;
	}
   public int xoa(String masv) throws Exception
   {
	   coso cs=new coso();
	   cs.ketnoi();
	   String sql="delete from SINHVIEN where MaSinhVien=?";
	   PreparedStatement stm=cs.con.prepareStatement(sql);
	   stm.setString(1, masv);
	   int kq=stm.executeUpdate();
	   cs.con.close();
	   return kq;
   }*/
	
}
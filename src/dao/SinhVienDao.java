package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import bean.DaoTaoNangCaoBean;
import bean.LoaiHinhCoQuanBean;
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
		String query = "SELECT SINHVIEN.MaTaiKhoan, MaSinhVien, NienKhoa, ThoiGianTotNghiep, \r\n" + 
					"	SoQuyetDinhTotNghiep, NgayKyQuyetDinhTotNghiep, \r\n" + 
				"		TenTruong,TenNganh\r\n" + 
				"FROM TRUONG RIGHT OUTER JOIN\r\n" + 
				"     SINHVIEN ON TRUONG.MaTruong = SINHVIEN.MaTruong LEFT OUTER JOIN\r\n" + 
				"     NGANHDAOTAO ON SINHVIEN.MaNganh = NGANHDAOTAO.MaNganh\r\n" + 
				"WHERE SINHVIEN.MaTaiKhoan = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { maTaiKhoan });
		
		if(resultSet.next()) {
			LocalDate ngayKyQuyetDinh = resultSet.getDate("NgayKyQuyetDinhTotNghiep") == null ? null : resultSet.getDate("NgayKyQuyetDinhTotNghiep").toLocalDate();
			LocalDate thoiGianTotNghiep = resultSet.getDate("ThoiGianTotNghiep") == null ? null : resultSet.getDate("ThoiGianTotNghiep").toLocalDate();
			sv = new SinhVienBean();
			sv.setMaSinhVien(resultSet.getInt("MaSinhVien"));
			sv.setTenNganh(resultSet.getString("TenNganh"));
			sv.setNgayKyQuyetDinhTotNghiep(ngayKyQuyetDinh);
			sv.setNienKhoa(resultSet.getString("NienKhoa"));
			sv.setSoQuyetDinhTotNghiep(resultSet.getString("SoQuyetDinhTotNghiep"));
			sv.setTenTruong(resultSet.getString("TenTruong"));
			sv.setThoiGianTotNghiep(thoiGianTotNghiep);
			
			TaiKhoanDao taiKhoanDao = new TaiKhoanDao();
			ThongTinTaiKhoanBean tk = taiKhoanDao.GetThongTin(maTaiKhoan);
			sv.setThongTinTaiKhoan(tk);
//			sv.setThongTinViecLam(this.GetThongTinViecLam(resultSet.getInt("MaSinhVien")));
		}
		resultSet.close();
		connectDB.Disconnect();
		return sv;
	}
	
	public int UpdateThongTinDaoTao(int maSinhVien, String maTruong, String maNganh, String nienKhoa,
			LocalDate thoiGianTotNghiep, String soQuyetDinh, LocalDate ngayKyQuyetDinh) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();

		String query = "UPDATE SINHVIEN \r\n" + 
				"SET MaTruong = ?, MaNganh = ?, NgayKyQuyetDinhTotNghiep = ?, SoQuyetDinhTotNghiep = ?, "
				+ "ThoiGianTotNghiep = ?, NienKhoa = ? \r\n" + 
				"WHERE MaSinhVien = ?";
		rowEffect = connectDB.executeUpdate(query, new Object[] { 
												maTruong,
												maNganh,
												Date.valueOf(ngayKyQuyetDinh), 
												soQuyetDinh, 
												Date.valueOf(thoiGianTotNghiep), 
												nienKhoa, 
												maSinhVien });
		
		connectDB.Disconnect();
		System.out.println("SinhVienDao - Update thong tin dao tao! RowEff = " + rowEffect);
		return rowEffect;
	}
	
	/*
	 * Thong tin viec lam
	 */
	public ThongTinViecLamBean GetThongTinViecLam(int maSinhVien) throws ClassNotFoundException, SQLException {
		ThongTinViecLamBean vl = null;
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT * FROM ThongTinViecLam WHERE MaSinhVien = ?";
		ResultSet resultSet = connectDB.executeQuery(query, new Object[] { maSinhVien });
		if (resultSet.next()) {
			vl = new ThongTinViecLamBean();
			vl.setDiaChiCoQuan(resultSet.getString("DiaChiCoQuan"));
			vl.setLoaiHinhCoQuan(resultSet.getInt("LoaiHinhCoQuan"));
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
	
	public int InsertThongTinViecLam(int maSinhVien, ThongTinViecLamBean thongTin) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "DELETE FROM DAOTAONANGCAO WHERE MaSinhVien = ?";
		rowEffect = connectDB.executeUpdate(query, new Object[] { maSinhVien });
		
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
		System.out.println("SinhVienDao - Insert thong tin viec lam - RE = " + rowEffect);
		connectDB.Disconnect();
		return rowEffect;
	}
	
	public int UpdateThongTinViecLam(int maSinhVien, ThongTinViecLamBean thongTin) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT MaSinhVien FROM THONGTINVIECLAM WHERE MaSinhVien = ?";
		ResultSet rs = connectDB.executeQuery(query, new Object[] { maSinhVien });
		// Neu chua co thi insert vao
		if(!rs.next()) {
			InsertThongTinViecLam(maSinhVien, thongTin);
		}
		else {
			query = "DELETE FROM DAOTAONANGCAO WHERE MaSinhVien = ?";
			rowEffect = connectDB.executeUpdate(query, new Object[] { maSinhVien });
			
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
			System.out.println("SinhVienDao - Update thong tin viec lam - RE = " + rowEffect );
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
			
			query = "DELETE FROM DAOTAONANGCAO WHERE MaSinhVien = ?";
			rowEffect = connectDB.executeUpdate(query, new Object[] { maSinhVien });
			connectDB.Disconnect();
		}
		System.out.println("SinhVienDao - Cap nhat thong tin viec lam - That nghiep - RE = " + rowEffect);
		return rowEffect;
	}
		
	public ArrayList<LoaiHinhCoQuanBean> getListLoaiHinhCoQuan() throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		ArrayList<LoaiHinhCoQuanBean> list = new ArrayList<>();
		
		String query = "SELECT * FROM LOAIHINHCOQUAN";
		ResultSet rs = connectDB.executeQuery(query, null);
		while(rs.next()) {
			list.add(new LoaiHinhCoQuanBean(rs.getInt("MaLoai"), rs.getString("TenLoai")));
		}
		rs.close();
		connectDB.Disconnect();
		return list;
	}
	
	public String getTenLoaiHinhCoQuan(int maLoai) throws SQLException, ClassNotFoundException {
		String result = null;
		
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT TenLoai FROM LOAIHINHCOQUAN WHERE MaLoai = ?";
		Object temp = connectDB.executeScalar(query, new Object[] { maLoai });
		result = temp == null ? null : temp.toString();
				
		connectDB.Disconnect();
		return result;
	}
	
	/*
	 * Dao tao nang cao
	 */
	public int UpdateThongTinDaoTaoNangCao(int maSinhVien, DaoTaoNangCaoBean daoTao) throws ClassNotFoundException, SQLException {
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		int rowEffect = 0;
		
		String query = "DELETE FROM THONGTINVIECLAM WHERE MaSinhVien = ?";
		rowEffect = connectDB.executeUpdate(query, new Object[] { maSinhVien });
		
		query = "UPDATE DAOTAONANGCAO\r\n" + 
				"SET MaTruong = ?, MaNganh = ?, TrinhDoDaoTao = ?, HinhThucDaoTao = ?, NienKhoa = ?\r\n" + 
				"WHERE (MaSinhVien = ?)";
		rowEffect = connectDB.executeUpdate(query, new Object[] {
				daoTao.getMaTruong(), 
				daoTao.getMaNganh(),
				daoTao.getTrinhDoDaoTao(),
				daoTao.getHinhThucDaoTao(),
				daoTao.getNienKhoa(),
				maSinhVien
		});
		System.out.println("SinhVienDao - Update thong tin dao tao nang cao - RE: " + rowEffect);
		System.out.println(daoTao.getMaTruong());
		System.out.println(daoTao.getMaNganh());
		connectDB.Disconnect();
		return rowEffect;
	}
	
	public int InsertThongTinDaoTaoNangCao(int maSinhVien, DaoTaoNangCaoBean daoTao) throws ClassNotFoundException, SQLException {
		int rowEffect = 0;
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "DELETE FROM THONGTINVIECLAM WHERE MaSinhVien = ?";
		rowEffect = connectDB.executeUpdate(query, new Object[] { maSinhVien });
		
		query = "INSERT INTO DAOTAONANGCAO\r\n" + 
				"(MaSinhVien, MaTruong, MaNganh, TrinhDoDaoTao, HinhThucDaoTao, NienKhoa)\r\n" + 
				"VALUES(?,?,?,?,?,?)";
		rowEffect = connectDB.executeUpdate(query, new Object[] {
				maSinhVien,
				daoTao.getMaTruong(),
				daoTao.getMaNganh(), 
				daoTao.getTrinhDoDaoTao(),
				daoTao.getHinhThucDaoTao(),
				daoTao.getNienKhoa()
		});
		System.out.println("SinhVienDao - Insert thong tin dao tao - RE: " + rowEffect);
		connectDB.Disconnect();
		return rowEffect;
	}
	
	public DaoTaoNangCaoBean GetThongTinDaoTaoNangCao(int maSinhVien) throws ClassNotFoundException, SQLException {
		DaoTaoNangCaoBean daoTao = null;
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		String query = "SELECT * FROM DAOTAONANGCAO WHERE MaSinhVien = ?";
		ResultSet rs = connectDB.executeQuery(query, new Object[] {
				maSinhVien
		});
		if(rs.next()) {
			daoTao = new DaoTaoNangCaoBean();
			daoTao.setMaSinhVien(rs.getInt("MaSinhVien"));
			daoTao.setMaTruong(rs.getString("MaTruong"));
			daoTao.setMaNganh(rs.getString("MaNganh"));
			daoTao.setTrinhDoDaoTao(rs.getString("TrinhDoDaoTao"));
			daoTao.setHinhThucDaoTao(rs.getString("HinhThucDaoTao"));
			daoTao.setNienKhoa(rs.getString("NienKhoa"));
		}
		connectDB.Disconnect();
		return daoTao;
	}
}

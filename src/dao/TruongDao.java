package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.TruongBean;

public class TruongDao {

	public int KhaiBaoTruong(String matruong, String tentruong, String loaihinh, String loaitruong,
			String tinhthanhtructhuoc, String diachi, String sdt, String sofax, String email, String website)
			throws Exception {
		String sql = "insert into TRUONG(matruong,tentruong,loaihinh,loaitruong,tinhthanhtructhuoc, diachi,SoDienThoai,sofax,email,website) values(?,?,?,?,?,?,?,?,?,?)";
		CoSo cs = new CoSo();
		cs.KetNoi();
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, matruong);
		cmd.setString(2, tentruong);
		cmd.setString(3, loaihinh);
		cmd.setString(4, loaitruong);
		cmd.setString(5, tinhthanhtructhuoc);
		cmd.setString(6, diachi);
		cmd.setString(7, sdt);
		cmd.setString(8, sofax);
		cmd.setString(9, email);
		cmd.setString(10, website);

		int kq = cmd.executeUpdate();
		cs.cn.close();
		return kq;

	}

	public int ChinhSuaTruong(String matruong, String tentruong, String loaihinh, String loaitruong,
			String tinhthanhtructhuoc, String diachi, String sdt, String sofax, String email, String website)
			throws Exception {
		String sql = "update TRUONG set TenTruong=?,LoaiHinh=?,LoaiTruong=?,TinhThanhTrucThuoc=?,DiaChi=?,SoDienThoai=?,SoFax=?,Email=?,Website=? where MaTruong=?";
		CoSo cs = new CoSo();
		cs.KetNoi();
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(10, matruong);
		cmd.setString(1, tentruong);
		cmd.setString(2, loaihinh);
		cmd.setString(3, loaitruong);
		cmd.setString(4, tinhthanhtructhuoc);
		cmd.setString(5, diachi);
		cmd.setString(6, sdt);
		cmd.setString(7, sofax);
		cmd.setString(8, email);
		cmd.setString(9, website);

		int kq = cmd.executeUpdate();
		cs.cn.close();
		System.out.println("CHINH SUA Thnah Cong");
		return kq;
	}
	
	public ArrayList<TruongBean> GetDanhSach() throws ClassNotFoundException, SQLException {
		ArrayList<TruongBean> list = new ArrayList<>();
		
		String query = "SELECT * FROM TRUONG";
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		ResultSet resultSet = connectDB.executeQuery(query, null);
		while(resultSet.next()) {
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
		String query = "DELETE FROM TRUONG WHERE MaTruong = ?";
		ConnectDB connectDB = new ConnectDB();
		connectDB.Connect();
		
		int rowEffect = connectDB.executeUpdate(query, new Object[] { maTruong });
		
		connectDB.Disconnect();
		return rowEffect;
	}
	
	public TruongBean TimTheoMa(String maTruong)throws Exception {
			String  sql ="select * from TRUONG where MaTruong=?";
			CoSo cs = new CoSo();
			cs.KetNoi();
			
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, maTruong);
			ResultSet rs=cmd.executeQuery();
			if(rs.next()){//duyet qua tap du lieu
				TruongBean truong = new TruongBean(rs.getString("MaTruong"),rs.getString("TenTruong"),rs.getString("LoaiHinh"),rs.getString("LoaiTruong"),rs.getString("TinhThanhTrucThuoc"),rs.getString("DiaChi"),rs.getString("SoDienThoai"),rs.getString("SoFax"),rs.getString("Email"),rs.getString("Website"));
				rs.close();//Dong RESULTSET
				cs.cn.close();//Dong ket noi
				System.out.println("TIM THEO MA THANH CONG");
				return truong;
			}
			System.out.println("TIM THEO MA THAT BAI");
			rs.close();//Dong RESULTSET
			cs.cn.close();//Dong ket noi
			return null;//tra ve ds
	}
}

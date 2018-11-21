package dao;

import java.sql.PreparedStatement;


public class TruongDao {
	
	public int KhaiBaoTruong(String matruong, String tentruong, String loaihinh, String loaitruong, String tinhthanhtructhuoc,
			String diachi, String sdt, String sofax, String email, String website) throws Exception
	{
		String  sql ="insert into TRUONG(matruong,tentruong,loaihinh,loaitruong,tinhthanhtructhuoc, diachi,SoDienThoai,sofax,email,website) values(?,?,?,?,?,?,?,?,?,?)";
		CoSo cs = new CoSo();
		cs.KetNoi();
		PreparedStatement cmd = cs.cn.prepareStatement(sql);
		cmd.setString(1, matruong);cmd.setString(2, tentruong);
		cmd.setString(3,loaihinh);cmd.setString(4,loaitruong);
		cmd.setString(5,tinhthanhtructhuoc);
		cmd.setString(6,diachi);
		cmd.setString(7,sdt);
		cmd.setString(8,sofax);
		cmd.setString(9,email);
		cmd.setString(10,website);
		
		int kq = cmd.executeUpdate();
		cs.cn.close();
		return kq;
		
	}
	
	public int ChinhSuaTruong(String matruong, String tentruong, String loaihinh, String loaitruong, String tinhthanhtructhuoc,
			String diachi, String sdt, String sofax, String email, String website) throws Exception
			{
				String  sql ="update TRUONG set TenTruong=?,LoaiHinh=?,LoaiTruong=?,TinhThanhTrucThuoc=?,DiaChi=?,SoDienThoai=?,SoFax=?,Email=?,Website=? where MaTruong=?";
				CoSo cs = new CoSo();
				cs.KetNoi();
				PreparedStatement cmd = cs.cn.prepareStatement(sql);
				cmd.setString(10, matruong);cmd.setString(1, tentruong);
				cmd.setString(2,loaihinh);cmd.setString(3,loaitruong);
				cmd.setString(4,tinhthanhtructhuoc);
				cmd.setString(5,diachi);
				cmd.setString(6,sdt);
				cmd.setString(7,sofax);
				cmd.setString(8,email);
				cmd.setString(9,website);
				
				int kq = cmd.executeUpdate();
				cs.cn.close();
				System.out.println("CHINH SUA Thnah Cong");
				return kq;
			
				
			}
}

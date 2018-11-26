package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.QLTaiKhoanBean;
import bean.ThongTinTaiKhoanBean;
import dao.CoSo;



public class QLTaiKhoanDao {
	Connect cn=new Connect();
	public ArrayList<QLTaiKhoanBean> getTaiKhoan() throws Exception
	{

		ArrayList<QLTaiKhoanBean> ds=new ArrayList<QLTaiKhoanBean>();
		cn.ketnoi();
		ResultSet rs=cn.getbang("TAIKHOAN");
		while(rs.next())
		{
			ThongTinTaiKhoanBean tt=new ThongTinTaiKhoanBean();
			String sql="SELECT * FROM THONGTINTAIKHOAN WHERE MaTaiKhoan=?";
			
			// tao doi tuong prepares:cmd
			PreparedStatement cmd= cn.cn.prepareStatement(sql);
			cmd.setInt(1, rs.getInt("MaTaiKhoan"));
			ResultSet rsult=cmd.executeQuery();
			
			
				if(rsult.next())
				{
					int maTaiKhoan=rsult.getInt("MaTaiKhoan");
					String hoVaTen=rsult.getString("HoVaTen");
					Date ngaySinh=rsult.getDate("NgaySinh");
					String gioiTinh=rsult.getString("GioiTinh");
					String cMND=rsult.getString("CMND");
					Date ngayCapCMND=rsult.getDate("NgayCapCMND");
					String noiCap=rsult.getString("NoiCapCMND");
					String danToc=rsult.getString("DanToc");
					String quocTich=rsult.getString("QuocTich");
					String diaChiThuongTru=rsult.getString("DiaChiThuongTru");
					String soDienThoai=rsult.getString("SoDienThoai");
					String email=rsult.getString("Email");
					String anhDaiDien=rsult.getString("AnhDaiDien");
					tt=new ThongTinTaiKhoanBean(maTaiKhoan, hoVaTen, ngaySinh, gioiTinh, cMND, ngayCapCMND, noiCap, danToc, quocTich, diaChiThuongTru, soDienThoai, email, anhDaiDien);
				}
			
			ds.add(new QLTaiKhoanBean(rs.getInt("MaTaiKhoan"),rs.getString("TenTaiKhoan").toString(),rs.getString("MatKhau").toString(),rs.getString("LoaiTaiKhoan").toString(),tt));
		}
		cn.cn.close();
		return ds;
	}

}

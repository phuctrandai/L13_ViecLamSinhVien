package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.NganhDaoTaoBean;

public class NganhDaoTaoDao {
	public ArrayList<NganhDaoTaoBean> getNganhDT(String matruong) throws Exception {
		ArrayList<NganhDaoTaoBean> listNganh = new ArrayList<NganhDaoTaoBean>();
		ConnectDB s = new ConnectDB();
		s.Connect();
		String sql = "select * from V_NGANHDT where MaTruong=?";
		
		ResultSet rs = s.executeQuery(sql, new Object[] { matruong });
		while (rs.next()) {
			listNganh.add(new NganhDaoTaoBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6)));
		}
		rs.close();
		s.Disconnect();
		return listNganh;
	}

	public ArrayList<NganhDaoTaoBean> getNganhDT() throws Exception {
		ArrayList<NganhDaoTaoBean> listNganh = new ArrayList<NganhDaoTaoBean>();
		ConnectDB s = new ConnectDB();
		s.Connect();
		
		String sql = "select * from NGANHDAOTAO";
		
		ResultSet rs = s.executeQuery(sql, null);
		while (rs.next()) {
			listNganh.add(new NganhDaoTaoBean(rs.getString("MaNganh"), rs.getString("TenNganh")));
		}
		rs.close();
		s.Disconnect();
		return listNganh;
	}
}

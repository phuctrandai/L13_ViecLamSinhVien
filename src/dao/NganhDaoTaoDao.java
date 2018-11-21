package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.NganhDaoTaoBean;
public class NganhDaoTaoDao {
	public ArrayList<NganhDaoTaoBean> getNganhDT(String matruong) throws Exception{
		ArrayList<NganhDaoTaoBean> listNganh = new ArrayList<NganhDaoTaoBean>();
		Connect s = new Connect(); s.ketnoi();
		String sql="select * from V_NGANHDT where MaTruong=?";
		PreparedStatement cmd=s.cn.prepareStatement(sql);
		cmd.setString(1, matruong);
		ResultSet rs = cmd.executeQuery();
		while(rs.next()) {
			listNganh.add(new NganhDaoTaoBean(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)));
		}
		rs.close();
		s.dongketnoi();
		return listNganh;
	}
	

}

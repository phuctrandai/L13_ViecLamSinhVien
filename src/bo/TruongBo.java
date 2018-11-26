package bo;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.TruongBean;
import dao.TruongDao;

public class TruongBo {
	TruongDao dao = new TruongDao();

	public int KhaiBaoTruong(String matruong, String tentruong, String loaihinh, String loaitruong,
			String tinhthanhtructhuoc, String diachi, String sdt, String sofax, String email, String website)
			throws Exception {
		return dao.KhaiBaoTruong(matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc, diachi, sdt, sofax,
				email, website);
	}

	public int ChinhSuaTruong(String matruong, String tentruong, String loaihinh, String loaitruong,
			String tinhthanhtructhuoc, String diachi, String sdt, String sofax, String email, String website)
			throws Exception {
		return dao.ChinhSuaTruong(matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc, diachi, sdt, sofax,
				email, website);
	}
	
	public ArrayList<TruongBean> GetDanhSach() throws ClassNotFoundException, SQLException {
		return dao.GetDanhSach();
	}
	
	public int XoaTruong(String maTruong) throws ClassNotFoundException, SQLException {
		return dao.XoaTruong(maTruong);
	}
}

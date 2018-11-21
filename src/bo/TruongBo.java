package bo;

import dao.TruongDao;

public class TruongBo {
	TruongDao dao = new TruongDao();
	
	public int KhaiBaoTruong(String matruong, String tentruong, String loaihinh, String loaitruong, String tinhthanhtructhuoc,
			String diachi, String sdt, String sofax, String email, String website) throws Exception
			{
				return dao.KhaiBaoTruong(matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc, diachi, sdt, sofax,email, website);
			}
	public int ChinhSuaTruong(String matruong, String tentruong, String loaihinh, String loaitruong, String tinhthanhtructhuoc,
			String diachi, String sdt, String sofax, String email, String website) throws Exception
			{
				return dao.ChinhSuaTruong(matruong, tentruong, loaihinh, loaitruong, tinhthanhtructhuoc, diachi, sdt, sofax,email, website);
			}
}

package bo;

import java.util.ArrayList;

import bean.QLTaiKhoanBean;
import dao.QLTaiKhoanDao;

public class QLTaiKhoanBo {
	QLTaiKhoanDao tkdao=new QLTaiKhoanDao();
	public ArrayList<QLTaiKhoanBean> getTaiKhoan() throws Exception
	{
		return tkdao.getTaiKhoan();
	}

}
